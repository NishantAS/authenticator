import 'package:authenticator/bloc/otp_code/otp_code_bloc.dart';
import 'package:authenticator/core/helpers/otp_card_clipper.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/core/widgets/clip_shadow_path.dart';
import 'package:authenticator/core/widgets/copy_to_clipboard_button.dart';
import 'package:authenticator/core/widgets/neon_progress_bar.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rolling_code_wheel.dart';

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value.
///
/// The text is displayed in bright green if [selected] is
/// true. This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class OtpCodeWidget extends StatefulWidget {
  final Animation<double> animation;

  final Secret secret;
  const OtpCodeWidget({
    super.key,
    required this.animation,
    required this.secret,
  });

  @override
  State<OtpCodeWidget> createState() => _OtpCodeWidgetState();
}

class _OtpCodeWidgetState extends State<OtpCodeWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final _scrollControllers = <FixedExtentScrollController>[];
  bool _original = false;
  AnimationController? _animationController;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.secret.interval,
    );
    for (var i = 0; i < widget.secret.length; i++) {
      _scrollControllers.add(
        FixedExtentScrollController(initialItem: _original ? 0 : 0 + 10 * 10),
      );
      _original = !_original;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => sl<OtpCodeBloc>()
        ..add(
          OtpCodeEvent.generateTotp(widget.secret),
        ),
      child: LayoutBuilder(
        builder: (context, constraints) => SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-constraints.minWidth, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: widget.animation,
              curve: Curves.decelerate,
            ),
          ),
          child: Stack(
            children: [
              BlocListener<OtpCodeBloc, OtpCodeState>(
                listener: (context, state) {
                  switch (state) {
                    case OtpCodeGenerated():
                      for (final (index, val) in state.code
                          .toString()
                          .padLeft(widget.secret.length, "0")
                          .characters
                          .indexed) {
                        _original = !_original;
                        _scrollControllers[index].animateToItem(
                          _original
                              ? int.parse(val)
                              : int.parse(val) + 11 * 10, // Do 10 roations
                          duration: const Duration(milliseconds: 3500),
                          curve: Easing.emphasizedDecelerate,
                        );
                      }
                      if (widget.secret.length.isEven) {
                        _original = !_original;
                      }
                      _animationController
                          ?.reverse(
                        from: state.timeRemaing.inMilliseconds /
                            widget.secret.interval.inMilliseconds,
                      )
                          .whenComplete(
                        () {
                          if (context.mounted) {
                            BlocProvider.of<OtpCodeBloc>(context).add(
                              OtpCodeEvent.generateTotp(
                                widget.secret,
                              ),
                            );
                          }
                        },
                      );
                      break;
                    default:
                      break;
                  }
                },
              ),
              ClipShadowPath(
                clipper: OtpCardClipper(),
                shadow: const BoxShadow(
                  blurRadius: 4,
                  color: Colors.blue,
                  offset: Offset(2, 2),
                ),
                child: InkWell(
                  onTap: () => context.router.navigate(
                    OtpCodeRoute(id: widget.secret.id),
                  ),
                  child: Container(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth * .5,
                                ),
                                child: Text(
                                  widget.secret.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          Expanded(
                            child: RollingCodeWheel(
                              length: widget.secret.length,
                              scrollControllers: _scrollControllers,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: BlocBuilder<OtpCodeBloc, OtpCodeState>(
                              builder: (context, state) => switch (state) {
                                OtpCodeGenerated() => NeonProgressBar(
                                    animation: _animationController!.view,
                                    begin: Colors.red,
                                    end: Colors.green,
                                  ),
                                _ => const LinearProgressIndicator()
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocBuilder<OtpCodeBloc, OtpCodeState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) => Align(
                  alignment: Alignment.topRight,
                  child: CopyToClipboardButton(
                    text: switch (state) {
                      OtpCodeGenerated() => state.code
                          .toString()
                          .padLeft(widget.secret.length, '0'),
                      _ => null,
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

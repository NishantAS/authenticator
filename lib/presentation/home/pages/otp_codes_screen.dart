import 'package:authenticator/bloc/secrets/secrets_bloc.dart';
import 'package:authenticator/core/constants/enums.dart';
import 'package:authenticator/core/constants/functions.dart';
import 'package:authenticator/core/constants/style.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/core/widgets/shimmer.dart';
import 'package:authenticator/core/helpers/custom_grid_delegate.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/otp_code_widget.dart';

@RoutePage()
class OtpCodesScreen extends StatefulWidget {
  const OtpCodesScreen({super.key});

  @override
  State<OtpCodesScreen> createState() => _OtpCodesScreenState();
}

class _OtpCodesScreenState extends State<OtpCodesScreen> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();
  final List<Secret> _list = [];
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  // Used to build list items that haven't been removed.
  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      Align(
        alignment: Alignment.center,
        child: OtpCodeWidget(
          animation: animation,
          secret: _list[index],
        ),
      );

  // Used to build an item after it has been removed from the list. This method
  // is needed because a removed item remains visible until its animation has
  // completed (even though it's gone as far as this ListModel is concerned).
  // The widget will be used by the [AnimatedGridState.removeItem] method's
  // [AnimatedGridRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
    Secret item,
    BuildContext context,
    Animation<double> animation,
  ) =>
      OtpCodeWidget(
        animation: animation,
        secret: item,
      );

  // Insert the "next item" into the list model.
  void _insert(Secret item) => setState(() {
        final int index = _list.length;
        _list.insert(index, item);
        _gridKey.currentState?.insertItem(
          index,
          duration: kCodeCardAnimationDuration,
        );
      });

  // Remove the selected item from the list model.
  void _remove(String id) => setState(() {
        final int index = _list.indexWhere(
          (element) => element.id == id,
        );
        final item = _list.removeAt(index);
        _gridKey.currentState?.removeItem(
          index,
          (context, animation) => _buildRemovedItem(item, context, animation),
          duration: kCodeCardAnimationDuration,
        );
      });

  Iterable<Secret> _onSearchChange(String? text) {
    if (text == null) return [];
    return _list.where(
      (secret) => secret.name.contains(
        RegExp(r'([a-z]+)|([A-Z][a-z]+)|([A-Z]+)')
            .allMatches(text)
            .cast<Match>()
            .map((match) => "(${match[0]})")
            .join(".*"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenType = getScreenSize(context);

    return Row(
      children: [
        Expanded(
          child: BlocProvider(
            create: (context) => sl<SecretsBloc>()
              ..add(
                const SecretsEvent.getSecrets(),
              ),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: MouseRegion(
                  cursor: SystemMouseCursors.text,
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return RawAutocomplete<Secret>(
                          focusNode: _focusNode,
                          textEditingController: _textEditingController,
                          displayStringForOption: (option) => option.name,
                          optionsBuilder: (TextEditingValue textEditingValue) =>
                              _onSearchChange(textEditingValue.text),
                          optionsViewBuilder: (
                            BuildContext context,
                            void Function(Secret) onSelected,
                            Iterable<Secret> options,
                          ) =>
                              Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              child: SizedBox(
                                width: constraints.biggest.width,
                                child: ListView.builder(
                                  itemCount: options.length,
                                  padding: EdgeInsets.zero,
                                  hitTestBehavior: HitTestBehavior.opaque,
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) => ListTile(
                                    title: Text(
                                      options.elementAt(index).name,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () => onSelected(
                                      options.elementAt(index),
                                    ),
                                    selected: AutocompleteHighlightedOption.of(
                                            context) ==
                                        index,
                                    selectedTileColor: Theme.of(context)
                                        .listTileTheme
                                        .selectedTileColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onFieldSubmitted,
                          ) =>
                              TextField(
                            decoration: const InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30),
                                ),
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                            controller: textEditingController,
                            focusNode: focusNode,
                            onSubmitted: (_) => onFieldSubmitted(),
                          ),
                          onSelected: (option) {
                            _textEditingController.clear();
                            _focusNode.previousFocus();
                            context.router.navigate(
                              OtpCodeRoute(id: option.id),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              body: BlocConsumer<SecretsBloc, SecretsState>(
                listener: (context, state) async => switch (state) {
                  SecretSaved() => _insert(state.secret),
                  SecretDeleted() => _remove(state.secret.id),
                  SceretsReceived() => setState(() {
                      final index = _list.length;
                      _list.addAll(state.secrets);
                      _gridKey.currentState!
                          .insertAllItems(index, state.secrets.length);
                    }),
                  _ => null,
                },
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      AnimatedGrid(
                        key: _gridKey,
                        gridDelegate:
                            const CustomGridDelegateWithFixedCrossExtent(
                          maxCrossAxisExtent: 300.0,
                          minCrossAxisExtent: 225.0,
                          crossAxisPadding: 10,
                          mainAxisPadding: 10,
                          childAspectRatio: 16 / 9,
                        ),
                        initialItemCount: _list.length,
                        itemBuilder: _buildItem,
                      ),
                      switch (state) {
                        SecretsLoading() => Shimmer(
                            linearGradient: kDefaultShimmerGradient,
                            child: GridView.builder(
                              gridDelegate:
                                  const CustomGridDelegateWithFixedCrossExtent(
                                maxCrossAxisExtent: 300.0,
                                minCrossAxisExtent: 275.0,
                                crossAxisPadding: 10,
                                mainAxisPadding: 10,
                                childAspectRatio: 16 / 9,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ShimmerLoading(
                                isLoading: true,
                                child: Card(
                                  child: Container(),
                                ),
                              ),
                            ),
                          ),
                        SecretsError() => throw UnimplementedError(),
                        _ => IgnorePointer(
                            child: AnimatedOpacity(
                              duration: _list.isEmpty
                                  ? kCodeCardAnimationDuration +
                                      kBackgroundAnimationDuration
                                  : kBackgroundAnimationDuration,
                              curve: _list.isEmpty
                                  ? const Interval(700 / 1100, 1.0)
                                  : Curves.linear,
                              opacity: _list.isEmpty ? 1 : 0,
                              child: Container(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: const Center(
                                  child: Text("There is nothing to show"),
                                ),
                              ),
                            ),
                          ),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (screenType == ScreenSize.xLarge)
          Expanded(
            child: AutoRouter(
              placeholder: (context) => const Scaffold(
                body: Center(
                  child: Text("Placeholder"),
                ),
              ),
            ),
          )
      ],
    );
  }
}

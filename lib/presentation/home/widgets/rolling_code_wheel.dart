import 'package:flutter/material.dart';

class RollingCodeWheel extends StatelessWidget {
  const RollingCodeWheel({
    super.key,
    required this.length,
    required List<FixedExtentScrollController> scrollControllers,
  }) : _scrollControllers = scrollControllers;

  final int length;
  final List<FixedExtentScrollController> _scrollControllers;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        for (var i = 0; i < length; ++i) ...[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
              ),
              child: Stack(
                children: [
                  ListWheelScrollView.useDelegate(
                    itemExtent: 14,
                    controller: _scrollControllers[i],
                    physics: const NeverScrollableScrollPhysics(),
                    squeeze: 0.5,
                    perspective: 0.01,
                    magnification: 2,
                    useMagnifier: true,
                    hitTestBehavior: HitTestBehavior.opaque,
                    childDelegate: ListWheelChildLoopingListDelegate(
                      children: [
                        "0",
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                      ]
                          .map(
                            (e) => Text(
                              e,
                              style: const TextStyle(
                                height: 1,
                              ),
                            ),
                          )
                          .toList(growable: false),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 18 * 2,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }
}

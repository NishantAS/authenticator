import 'dart:async';

import 'package:flutter/material.dart';

class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({
    super.key,
    required this.initiallyExtended,
    required this.destinations,
    required this.initalDestinationIndex,
    this.leading,
    this.trailing,
    required this.onDestinationSelected,
  });

  final bool initiallyExtended;
  final List<NavigationRailDestination> destinations;
  final int initalDestinationIndex;
  final Widget Function(VoidCallback toggleExtended)? leading;
  final Widget Function(VoidCallback toggleExtended)? trailing;
  final FutureOr<void> Function(int index) onDestinationSelected;

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  late bool _extended;
  late int _idx;

  @override
  void initState() {
    super.initState();
    _extended = widget.initiallyExtended;
    _idx = widget.initalDestinationIndex;
  }

  void _toggleExtended() => setState(() => _extended = !_extended);

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: _extended,
      selectedIndex: _idx,
      onDestinationSelected: (index) async {
        await widget.onDestinationSelected(index);
        setState(() => _idx = index);
      },
      leading: widget.leading?.call(_toggleExtended),
      trailing: widget.trailing == null
          ? null
          : Expanded(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  widget.trailing!.call(_toggleExtended)
                ],
              ),
            ),
      destinations: widget.destinations,
    );
  }
}

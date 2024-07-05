import 'package:authenticator/bloc/auth/auth_bloc.dart';
import 'package:authenticator/core/constants/enums.dart';
import 'package:authenticator/core/constants/functions.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/presentation/home/widgets/navigation_rail_entry_widget.dart';
import 'package:authenticator/presentation/home/widgets/navigation_rail_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationDestination {
  final Widget icon;
  final Widget selectedIcon;
  final String label;
  final bool enabled;
  final String relPath;

  const CustomNavigationDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.enabled,
    required this.relPath,
  });
}

const destinations = <CustomNavigationDestination>[
  CustomNavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: "Home",
    enabled: true,
    relPath: '/',
  ),
  CustomNavigationDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: "Settings",
    enabled: true,
    relPath: '/settings',
  ),
];

NavigationRailDestination _navigationRailDestination(
  CustomNavigationDestination destination,
) =>
    NavigationRailDestination(
      icon: destination.icon,
      label: Text(destination.label),
      disabled: !destination.enabled,
      selectedIcon: destination.selectedIcon,
    );

NavigationDestination _navigationDestination(
  CustomNavigationDestination destination,
) =>
    NavigationDestination(
      icon: destination.icon,
      label: destination.label,
      enabled: destination.enabled,
      selectedIcon: destination.selectedIcon,
    );

@RoutePage()
class CodesScreen extends StatefulWidget {
  const CodesScreen({super.key});

  @override
  State<CodesScreen> createState() => _CodesScreenState();
}

class _CodesScreenState extends State<CodesScreen> {
  final _routerKey = GlobalKey<AutoTabsRouterState>();

  ValueNotifier<int> index = ValueNotifier(0);

  void _onDestinationSelected(int idx) {
    _routerKey.currentState!.controller!.setActiveIndex(idx);
    index.value = idx;
  }

  @override
  Widget build(BuildContext context) {
    final screenType = getScreenSize(context);

    final body = AutoTabsRouter.pageView(
      key: _routerKey,
      routes: [
        LoginRoute(onLogin: () {}),
        SignUpRoute(onSignup: () {}),
      ],
      builder: (context, child, pageController) => child,
      homeIndex: index.value,
    );

    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: switch (screenType) {
        ScreenSize.compact => Scaffold(
            appBar: AppBar(),
            body: body,
            bottomNavigationBar: ValueListenableBuilder(
              valueListenable: index,
              builder: (context, idx, child) {
                return NavigationBar(
                  destinations:
                      destinations.map(_navigationDestination).toList(),
                  onDestinationSelected: _onDestinationSelected,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                  selectedIndex: idx,
                );
              },
            ),
          ),
        ScreenSize.medium ||
        ScreenSize.expanded ||
        ScreenSize.large ||
        ScreenSize.xLarge =>
          Row(
            children: [
              IntrinsicWidth(
                child: NavigationRailWidget(
                  initalDestinationIndex: index.value,
                  initiallyExtended: switch (screenType) {
                    ScreenSize.medium || ScreenSize.expanded => false,
                    _ => true
                  },
                  destinations: destinations
                      .map(_navigationRailDestination)
                      .toList(growable: false),
                  onDestinationSelected: _onDestinationSelected,
                  leading: (toggleExtended) => Builder(
                    builder: (context) {
                      final animation =
                          NavigationRail.extendedAnimation(context);
                      return NavigationRailEntryWidget(
                        label: Container(),
                        child: IconButton(
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: animation,
                          ),
                          onPressed: toggleExtended,
                        ),
                      );
                    },
                  ),
                  trailing: (toggleExtended) => NavigationRailEntryWidget(
                    label: Text(
                      "Logout",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              const VerticalDivider(
                thickness: 1,
                width: 1,
              ),
              Expanded(
                child: Scaffold(
                  body: body,
                ),
              ),
              if (screenType == ScreenSize.xLarge)
                const Expanded(
                  child: Scaffold(),
                )
            ],
          ),
      },
    );
  }
}

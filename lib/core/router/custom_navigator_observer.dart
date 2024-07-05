import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomNavigatorObserver extends AutoRouterObserver {
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log('Tab route change From: ${previousRoute.path} To: ${route.path}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('Tab route change From: ${previousRoute?.path} To: ${route.path}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log("Route pop From: ${previousRoute?.data?.path} To: ${route.data?.path} with result: ${previousRoute?.currentResult}");
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log("Route pushed From: ${previousRoute?.data?.path} To: ${route.data?.path} with args: ${route.data?.args}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log("Route rmeoved From: ${previousRoute?.data?.path} To: ${route.data?.path} with result: ${previousRoute?.currentResult}");
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log("Route replaced From: ${oldRoute?.data?.path} To: ${newRoute?.data?.path} with args: ${newRoute?.data?.args}");
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    // TODO: implement didStartUserGesture
  }

  @override
  void didStopUserGesture() {
    // TODO: implement didStopUserGesture
  }
}

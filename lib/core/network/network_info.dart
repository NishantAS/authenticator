import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  bool get isConnected;
}

class NetworkInfoImpl with Disposable implements NetworkInfo {
  bool _isConnected = false;
  final Connectivity connectivity;
  final InternetConnectionChecker internetConnectionChecker;
  late final StreamSubscription<List<ConnectivityResult>> subscription;

  NetworkInfoImpl({
    required this.connectivity,
    required this.internetConnectionChecker,
  }) {
    subscription = connectivity.onConnectivityChanged.listen(
      (results) async {
        if (results.contains(ConnectivityResult.none)) {
          _isConnected = false;
        } else {
          // _isConnected = await internetConnectionChecker.hasConnection;
        }
      },
    );
  }

  @override
  bool get isConnected => _isConnected;

  @override
  Future<void> onDispose() async {
    await subscription.cancel();
  }
}

// import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'connectivity_status.g.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisonnected }

@riverpod
class ConnectivityStatusNotifier extends _$ConnectivityStatusNotifier {
  ConnectivityStatus? lastResult;
  ConnectivityStatus? newState;

  @override
  ConnectivityStatus build() {
    return ConnectivityStatus.notDetermined;
  }

  void update() {
    if (state == ConnectivityStatus.isConnected) {
      lastResult = ConnectivityStatus.isConnected;
    } else {
      lastResult = ConnectivityStatus.isDisonnected;
    }
    lastResult = ConnectivityStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
          newState = ConnectivityStatus.isConnected;
          break;
        case ConnectivityResult.none:
          newState = ConnectivityStatus.isDisonnected;
          break;
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.vpn:
        case ConnectivityResult.other:
      }
      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}

// class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
//   // StreamController<ConnectivityResult> controller =
//   //     StreamController<ConnectivityResult>();

//   ConnectivityStatus? lastResult;
//   ConnectivityStatus? newState;

//   ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
//     if (state == ConnectivityStatus.isConnected) {
//       lastResult = ConnectivityStatus.isConnected;
//     } else {
//       lastResult = ConnectivityStatus.isDisonnected;
//     }
//     lastResult = ConnectivityStatus.notDetermined;
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       switch (result) {
//         case ConnectivityResult.mobile:
//         case ConnectivityResult.wifi:
//           newState = ConnectivityStatus.isConnected;
//           break;
//         case ConnectivityResult.none:
//           newState = ConnectivityStatus.isDisonnected;
//           break;
//         case ConnectivityResult.bluetooth:
//         case ConnectivityResult.ethernet:
//         case ConnectivityResult.vpn:
//         case ConnectivityResult.other:
//       }
//       if (newState != lastResult) {
//         state = newState!;
//         lastResult = newState;
//       }
//     });
//   }
// }

// final connectivityStatusProviders = StateNotifierProvider((ref) {
//   return ConnectivityStatusNotifier();
// });

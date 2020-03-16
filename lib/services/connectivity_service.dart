import 'dart:async';

import 'package:connectivity/connectivity.dart';

import '../enums/connectivity_enum.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      //convert result to enum
      final connectionStatus = _getConnectivityStatus(result);
      //broadcast this over the stream
      connectionStatusController.add(connectionStatus);
    });
  }

  ConnectivityStatus _getConnectivityStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Mobile;
        break;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.Wifi;
        break;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
        break;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}

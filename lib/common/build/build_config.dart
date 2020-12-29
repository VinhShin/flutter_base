
import 'package:e_mobiz/common/utils/string_utils.dart';
import 'package:flutter/material.dart';

enum Flavor { DEVELOPMENT, STAGING, PREPROD, RELEASE }

class BuildConfig {
  final String baseUrl;
  final String socketUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final Flavor flavor;
  final Color color;
  final Map<String, String> serverConfig;

  BuildConfig._(
      {@required this.baseUrl,
        @required this.socketUrl,
        @required this.connectTimeout,
        @required this.receiveTimeout,
        @required this.flavor,
        @required this.serverConfig,
        this.color = Colors.blue});

  BuildConfig._development()
      : this._(
      baseUrl: 'https://tscare.inapps.technology',
      socketUrl: '',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      flavor: Flavor.DEVELOPMENT,
      serverConfig: {
        "type": "magento",
        "url": "https://tscare.inapps.technology",
        "accessToken": "u6z3bg03ypl2o92685wt7e3i9sjmcq4m",
        "blog": "http://demo.mstore.io"
      },
  );

  BuildConfig._staging()
      : this._(
      baseUrl: 'https://tscare.inapps.technology',
      socketUrl: '',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      flavor: Flavor.STAGING,
      serverConfig: {
        "type": "magento",
        "url": "https://tscare.inapps.technology",
        "accessToken": "u6z3bg03ypl2o92685wt7e3i9sjmcq4m",
        "blog": "http://demo.mstore.io"
      },
  );

  BuildConfig._preprod()
      : this._(
      baseUrl: 'https://tscare.inapps.technology',
      socketUrl: '',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      flavor: Flavor.PREPROD,
      serverConfig: {
        "type": "magento",
        "url": "https://tscare.inapps.technology",
        "accessToken": "u6z3bg03ypl2o92685wt7e3i9sjmcq4m",
        "blog": "http://demo.mstore.io"
      },
  );

  BuildConfig._release()
      : this._(
      baseUrl: 'https://tscare.inapps.technology',
      socketUrl: '',
      connectTimeout: 15000,
      receiveTimeout: 15000,
      flavor: Flavor.RELEASE,
      serverConfig: {
        "type": "magento",
        "url": "https://tscare.inapps.technology",
        "accessToken": "u6z3bg03ypl2o92685wt7e3i9sjmcq4m",
        "blog": "http://demo.mstore.io"
      },
  );

  static BuildConfig _instance;

  static init({Flavor flavor}) {
    if (_instance == null) {
      print('╔══════════════════════════════════════════════════════════════╗');
      print('                    Build Flavor: $flavor                       ');
      print('╚══════════════════════════════════════════════════════════════╝');
      switch (flavor) {
        case Flavor.DEVELOPMENT:
          _instance = BuildConfig._development();
          break;
        case Flavor.STAGING:
          _instance = BuildConfig._staging();
          break;
        case Flavor.PREPROD:
          _instance = BuildConfig._preprod();
          break;
        default:
          _instance = BuildConfig._release();
          break;
      }
    }
    _iniLog(flavor);
  }

  static BuildConfig get() {
    return _instance;
  }

  static _iniLog(flavor) async {
//    await Log.init();
//    switch (_instance.flavor) {
//      case Flavor.DEVELOPMENT:
//      case Flavor.STAGING:
//      case Flavor.PREPROD:
//        Log.setLevel(Level.ALL);
//        break;
//      case Flavor.RELEASE:
//        Log.setLevel(Level.OFF);
//        break;
//    }
  }

  static String flavorName() =>
      StringUtils.enumToName(_instance.flavor.toString());

  static bool isRelease() => _instance.flavor == Flavor.RELEASE;

  static bool isProduction() => _instance.flavor == Flavor.PREPROD;

  static bool isStaging() => _instance.flavor == Flavor.STAGING;

  static bool isDevelopment() => _instance.flavor == Flavor.DEVELOPMENT;
}

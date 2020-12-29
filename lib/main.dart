import 'dart:async';

import 'package:e_mobiz/common/styles/theme.dart';
import 'package:e_mobiz/presentation/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'common/build/build_config.dart';
import 'common/utils/logging.dart';
import 'dj/injection/injection.dart';

void main() => Main();


class Main extends Env {

  @override
  FutureOr<StatefulWidget> onCreate() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Container(color: Colors.transparent);
    };
    return MainApp();
  }
}


abstract class Env {

  Env() {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();
      BuildConfig.init(flavor: Flavor.STAGING);
      await Injection.inject();
//      await Injection.prepareData();
//      HttpOverrides.global = MyHttpOverrides();
      final StatefulWidget app = await onCreate();
      runApp(app);
    }, onError: (Object obj, StackTrace stack) {
      Log.fine("Env", stack.toString(), obj, stack);
    });
  }

  FutureOr<StatefulWidget> onCreate();
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      title: 'App abc',
      theme: AppTheme.MyTheme,
      // initialRoute: Injection.getIt<AppBloc>().appModel.initRoute,
      home: Scaffold(
          body: LoginScreen()
      ),
    );
  }
}

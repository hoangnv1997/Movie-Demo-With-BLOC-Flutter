import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedemo/environment/app_config.dart';
import 'package:moviedemo/main/my_app.dart';
import 'package:moviedemo/routing/app_routing.dart';
import 'package:moviedemo/utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final isLogin = false;
  final String initialRoute =
      isLogin ? RouteDefine.root.name : RouteDefine.login.name;

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  AppConfig configuredApp = AppConfig(
    environment: Environment.product,
    baseUrl: Const.baseUrlProduct,
    child: MyApp(
      initialRoute: initialRoute,
    ),
  );

  runApp(configuredApp);
}

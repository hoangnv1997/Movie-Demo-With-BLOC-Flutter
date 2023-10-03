import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moviedemo/di/injection.dart';
import 'package:moviedemo/environment/app_config.dart';
import 'package:moviedemo/main/app_bloc_observer.dart';
import 'package:moviedemo/main/my_app.dart';
import 'package:moviedemo/repository/auth_repository.dart';
import 'package:moviedemo/routing/app_routing.dart';
import 'package:moviedemo/utils/const.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependency(baseUrl: Const.baseUrlDevelop);
  await Firebase.initializeApp();

  final isLogin = await getIt<AuthRepository>().isLoggedIn();
  final String initialRoute =
      isLogin ? RouteDefine.root.name : RouteDefine.login.name;

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  AppConfig configuredApp = AppConfig(
    environment: Environment.develop,
    baseUrl: Const.baseUrlDevelop,
    child: MyApp(
      initialRoute: initialRoute,
    ),
  );

  if (kDebugMode) {
    Bloc.observer = AppBlocObserver();
  }
  runApp(configuredApp);
}
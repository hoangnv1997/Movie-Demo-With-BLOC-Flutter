import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviedemo/bindings/app_binding.dart';
import 'package:moviedemo/common/theme/app_themes.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/routing/app_routing.dart';
import 'package:moviedemo/utils/const.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return ScreenUtilInit(
      designSize: Const.screenDesignSize,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          theme: AppThemes.lightTheme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialBinding: AppBinding(),
          initialRoute: initialRoute,
          getPages: AppRouting.getPages,
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}

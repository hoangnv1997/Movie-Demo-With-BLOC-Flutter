import 'package:flutter/material.dart';
import 'package:moviedemo/ui/home/page/home_page.dart';
import 'package:moviedemo/ui/login/page/login_page.dart';
import 'package:moviedemo/ui/register/page/register_page.dart';
import 'package:moviedemo/ui/root/page/root_page.dart';

enum RouteDefine {
  register,
  login,
  root,
  home,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.register.name: (_) => const RegisterPage(),
      RouteDefine.login.name: (_) => const LoginPage(),
      RouteDefine.root.name: (_) => const RootPage(),
      RouteDefine.home.name: (_) => const HomePage(),
    };

    final routeBuider = routes[settings.name];

    return MaterialPageRoute(
      builder: (context) => routeBuider!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

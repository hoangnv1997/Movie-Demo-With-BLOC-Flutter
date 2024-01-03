import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:moviedemo/ui/home/controller/home_binding.dart';
import 'package:moviedemo/ui/home/page/home_page.dart';
import 'package:moviedemo/ui/login/controller/login_binding.dart';
import 'package:moviedemo/ui/login/page/login_page.dart';
import 'package:moviedemo/ui/register/controller/register_binding.dart';
import 'package:moviedemo/ui/register/page/register_page.dart';
import 'package:moviedemo/ui/root/controller/root_binding.dart';
import 'package:moviedemo/ui/root/page/root_page.dart';
import 'package:moviedemo/ui/search/controller/search_binding.dart';
import 'package:moviedemo/ui/search/page/search_page.dart';
import 'package:moviedemo/ui/settings/controller/settings_binding.dart';
import 'package:moviedemo/ui/settings/page/settings_page.dart';
import 'package:moviedemo/ui/trending/controller/trending_binding.dart';
import 'package:moviedemo/ui/trending/page/trending_page.dart';

enum RouteDefine {
  register,
  login,
  root,
  home,
  trending,
  search,
  settings,
}

class AppRouting {
  static final homePage = '/${RouteDefine.home.name}';
  static final registerPage = '/${RouteDefine.register.name}';
  static final loginPage = '/${RouteDefine.login.name}';
  static final rootPage = '/${RouteDefine.root.name}';
  static final trendingPage = '/${RouteDefine.trending.name}';
  static final searchPage = '/${RouteDefine.search.name}';
  static final settingsPage = '/${RouteDefine.settings.name}';
  static final List<GetPage> getPages = [
    GetPage(
      name: registerPage,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: rootPage,
      page: () => RootPage(),
      binding: RootBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: trendingPage,
      page: () => TrendingPage(),
      binding: TrendingBinding(),
    ),
    GetPage(
      name: searchPage,
      page: () => SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: settingsPage,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
  ];
}

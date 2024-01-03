import 'package:get/get.dart';
import 'package:moviedemo/repository/home_repository.dart';
import 'package:moviedemo/ui/home/controller/home_controller.dart';
import 'package:moviedemo/ui/root/controller/root_controller.dart';
import 'package:moviedemo/ui/search/controller/search_controller.dart';
import 'package:moviedemo/ui/settings/controller/settings_controller.dart';
import 'package:moviedemo/ui/trending/controller/trending_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl());
    Get.put(RootController());
    Get.put(HomeController());
    Get.put(TrendingController());
    Get.put(SearchPageController());
    Get.put(SettingsController());
  }
}

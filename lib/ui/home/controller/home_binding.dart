import 'package:get/get.dart';
import 'package:moviedemo/repository/home_repository.dart';
import 'package:moviedemo/ui/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl());
  }
}

import 'package:get/get.dart';
import 'package:moviedemo/environment/app_config.dart';
import 'package:moviedemo/repository/network_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkRepository>(() =>
        NetworkRepositoryImpl(baseUrl: AppConfig.of(Get.context!).baseUrl));
  }
}

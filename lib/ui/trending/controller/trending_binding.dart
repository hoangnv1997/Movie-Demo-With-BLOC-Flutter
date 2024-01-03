import 'package:get/get.dart';
import 'package:moviedemo/ui/trending/controller/trending_controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrendingController());
  }
}

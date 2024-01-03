import 'package:get/get.dart';
import 'package:moviedemo/common/controller/base_controller.dart';
import 'package:moviedemo/routing/app_routing.dart';
import 'package:moviedemo/utils/call_api.dart';

class LoginController extends BaseController {
  final email = ''.obs;
  final password = ''.obs;
  final isShowPassword = false.obs;

  final minPassLength = 6;
  final maxPassLength = 20;

  bool isEnableRegisterButton() =>
      password.value.length >= minPassLength &&
      password.value.length <= maxPassLength &&
      email.isNotEmpty;

  void login() async {
    changeStatus(newStatus: Status.loading);
    handleWithError(methodCallApi: () async {});
    await Future.delayed(const Duration(seconds: 2));
    changeStatus(newStatus: Status.success);
    Get.offAllNamed(AppRouting.rootPage);
  }
}

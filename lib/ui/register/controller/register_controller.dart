import 'package:get/get.dart';
import 'package:moviedemo/common/controller/base_controller.dart';
import 'package:moviedemo/utils/call_api.dart';

class RegisterController extends BaseController {
  final email = ''.obs;
  final password = ''.obs;
  final isShowPassword = false.obs;

  final minPassLength = 6;
  final maxPassLength = 20;

  bool isEnableRegisterButton() =>
      password.value.length >= minPassLength &&
      password.value.length <= maxPassLength &&
      email.isNotEmpty;

  void register() async {
    handleWithError(methodCallApi: () async {});
  }
}

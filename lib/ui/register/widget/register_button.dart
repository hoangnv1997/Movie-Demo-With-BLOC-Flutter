import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedemo/common/controller/base_controller.dart';
import 'package:moviedemo/common/widget/custom_button.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/register/controller/register_controller.dart';

class RegisterButton extends GetView<RegisterController> {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: CustomButton(
          text: S.current.register,
          enable: controller.isEnableRegisterButton(),
          isLoading: controller.status.value == Status.loading,
          action: () {
            controller.register();
          },
        ),
      );
    });
  }
}

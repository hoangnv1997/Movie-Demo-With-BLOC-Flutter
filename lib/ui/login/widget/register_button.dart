import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedemo/common/widget/custom_button.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/routing/app_routing.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomButton(
        text: S.current.register,
        enable: true,
        action: () {
          Get.toNamed(RouteDefine.register.name);
        },
      ),
    );
  }
}

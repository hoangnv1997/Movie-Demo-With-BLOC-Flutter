import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:moviedemo/common/image/app_images.dart';
import 'package:moviedemo/common/widget/input_form.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/register/controller/register_controller.dart';

class PasswordInput extends GetView<RegisterController> {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: InputForm(
          hint: S.current.password,
          borderRadius: 5,
          textStyle: TextStyle(fontSize: 18.sp, height: 1),
          onChanged: (password) {
            controller.password.value = password;
          },
          obscureText: !controller.isShowPassword.value,
          suffixIconConstraints:
              BoxConstraints(minWidth: 22.w, minHeight: 22.w),
          suffixIcon: _buildShowOrHidePassIcon(),
        ),
      );
    });
  }

  Widget _buildShowOrHidePassIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: GestureDetector(
        onTap: () {
          final currentState = controller.isShowPassword.value;
          controller.isShowPassword.value = !currentState;
        },
        child: SizedBox(
          width: 22.w,
          height: 22.w,
          child: SvgPicture.asset(
            controller.isShowPassword.value
                ? AppImages.eyeHide
                : AppImages.eyeNotHide,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

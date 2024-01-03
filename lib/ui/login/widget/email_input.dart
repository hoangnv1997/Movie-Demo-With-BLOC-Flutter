import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moviedemo/common/widget/input_form.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/login/controller/login_controller.dart';

class EmailInput extends GetView<LoginController> {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InputForm(
        hint: S.current.email,
        borderRadius: 5,
        textStyle: TextStyle(fontSize: 18.sp, height: 1),
        onChanged: (email) {
          controller.email.value = email;
        },
      ),
    );
  }
}

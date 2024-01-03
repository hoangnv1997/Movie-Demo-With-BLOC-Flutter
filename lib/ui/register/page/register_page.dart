import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/image/app_images.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/register/controller/register_controller.dart';
import 'package:moviedemo/ui/register/widget/email_input.dart';
import 'package:moviedemo/ui/register/widget/password_input.dart';
import 'package:moviedemo/ui/register/widget/register_button.dart';

class RegisterPage extends BasePage<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Color getPageBackgroundColor() => AppColor.black;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SvgPicture.asset(AppImages.appbarBackArrow),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 48),
            child: FittedBox(
              child: Text(
                S.current.register,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.black,
      centerTitle: true,
      toolbarHeight: 60.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100.h),
          Center(
            child: Image.asset(
              AppImages.icMovie,
              width: 100.w,
              height: 100.w,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 35.h),
          const EmailInput(),
          SizedBox(height: 15.h),
          const PasswordInput(),
          SizedBox(height: 15.h),
          const RegisterButton(),
        ],
      ),
    );
  }
}

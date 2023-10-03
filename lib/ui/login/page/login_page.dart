import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviedemo/common/bloc/bloc_listener_creation.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/image/app_images.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/routing/app_routing.dart';
import 'package:moviedemo/ui/login/bloc/login_bloc.dart';
import 'package:moviedemo/ui/login/widget/email_input.dart';
import 'package:moviedemo/ui/login/widget/login_button.dart';
import 'package:moviedemo/ui/login/widget/password_input.dart';
import 'package:moviedemo/ui/login/widget/register_button.dart';
import 'package:moviedemo/utils/utils_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBasePage(
      appBar: _buildAppBar(context),
      backgroundColor: AppColor.black,
      body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 48),
            child: FittedBox(
              child: Text(
                S.current.login,
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

  Widget _buildBody() {
    return createBlocListener<LoginEvent, LoginState, LoginBloc>(
      listenWhen: (previous, current) {
        return previous.status != current.status ||
            previous.loginStatus != current.loginStatus;
      },
      onError: (context, state) {
        print("onError ${state?.loginStatus}");
        UtilsHelper.showSnackBar(
            context: context, content: '${state?.loginStatus}');
      },
      onSuccess: (context, state) {
        print("onSuccess ${state?.loginStatus}");
        UtilsHelper.showSnackBar(
            context: context, content: '${state?.loginStatus}');
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RouteDefine.root.name, (route) => false);
      },
      child: SingleChildScrollView(
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
            const LoginButton(),
            SizedBox(height: 15.h),
            const RegisterButton(),
          ],
        ),
      ),
    );
  }
}

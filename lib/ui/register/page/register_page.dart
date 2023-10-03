import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviedemo/common/bloc/bloc_listener_creation.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/image/app_images.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/routing/app_routing.dart';
import 'package:moviedemo/ui/register/bloc/register_bloc.dart';
import 'package:moviedemo/ui/register/widget/email_input.dart';
import 'package:moviedemo/ui/register/widget/password_input.dart';
import 'package:moviedemo/ui/register/widget/register_button.dart';
import 'package:moviedemo/utils/utils_helper.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBasePage(
      appBar: _buildAppBar(context),
      backgroundColor: AppColor.black,
      body: BlocProvider(
        create: (context) => getIt<RegisterBloc>(),
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

  Widget _buildBody() {
    return createBlocListener<RegisterEvent, RegisterState, RegisterBloc>(
      listenWhen: (previous, current) {
        return previous.status != current.status ||
            previous.registerStatus != current.registerStatus;
      },
      onError: (context, state) {
        print("onError ${state?.registerStatus}");
        UtilsHelper.showSnackBar(
            context: context, content: '${state?.registerStatus}');
      },
      onSuccess: (context, state) {
        print("onSuccess ${state?.registerStatus}");
        UtilsHelper.showSnackBar(
            context: context, content: '${state?.registerStatus}');
        Navigator.of(context).pushReplacementNamed(RouteDefine.login.name);
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
            const RegisterButton(),
          ],
        ),
      ),
    );
  }
}

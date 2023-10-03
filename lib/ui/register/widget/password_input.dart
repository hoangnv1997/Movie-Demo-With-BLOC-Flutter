import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moviedemo/common/image/app_images.dart';
import 'package:moviedemo/common/widget/input_form.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/register/bloc/register_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: InputForm(
            hint: S.current.password,
            borderRadius: 5,
            textStyle: TextStyle(fontSize: 18.sp, height: 1),
            onChanged: (password) {
              context
                  .read<RegisterBloc>()
                  .add(RegisterPasswordChanged(password: password));
            },
            obscureText: !state.isShowPassword,
            suffixIconConstraints:
                BoxConstraints(minWidth: 22.w, minHeight: 22.w),
            suffixIcon: _buildShowOrHidePassIcon(state, context),
          ),
        );
      },
    );
  }

  Widget _buildShowOrHidePassIcon(RegisterState state, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: GestureDetector(
        onTap: () {
          context.read<RegisterBloc>().add(const RegisterShowOrHidePass());
        },
        child: SizedBox(
          width: 22.w,
          height: 22.w,
          child: SvgPicture.asset(
            state.isShowPassword ? AppImages.eyeHide : AppImages.eyeNotHide,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

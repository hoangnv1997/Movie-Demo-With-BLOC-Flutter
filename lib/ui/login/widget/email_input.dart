import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviedemo/common/widget/input_form.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/login/bloc/login_bloc.dart';

class EmailInput extends StatelessWidget {
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
          context.read<LoginBloc>().add(LoginEmailChanged(email: email));
        },
      ),
    );
  }
}

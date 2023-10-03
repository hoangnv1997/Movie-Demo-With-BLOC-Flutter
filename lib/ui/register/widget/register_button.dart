import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedemo/common/bloc/base_state.dart';
import 'package:moviedemo/common/bloc/bloc_builder_creation.dart';
import 'package:moviedemo/common/widget/custom_button.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/ui/register/bloc/register_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: createBlocBuilder<RegisterEvent, RegisterState, RegisterBloc>(
        buildWhen: (previous, current) {
          return previous.isEnableRegisterButton() !=
                  current.isEnableRegisterButton() ||
              previous.status != current.status;
        },
        builder: (context, state) {
          return CustomButton(
            text: S.current.register,
            enable: state.isEnableRegisterButton(),
            isLoading: state.status == BlocStatus.loading,
            action: () {
              context.read<RegisterBloc>().add(const RegisterPressed());
            },
          );
        },
      ),
    );
  }
}

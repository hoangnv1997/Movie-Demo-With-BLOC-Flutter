import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedemo/common/bloc/base_state.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/repository/auth_repository.dart';
import 'package:moviedemo/utils/connectivity_manager.dart';
import 'package:moviedemo/utils/validator.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository;

  RegisterBloc(this._authRepository) : super(const RegisterState()) {
    on<RegisterShowOrHidePass>(_onShowOrHidePass);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterPressed>(_onRegisterPressed);
  }

  void _onShowOrHidePass(
    RegisterShowOrHidePass event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onRegisterPressed(
    RegisterPressed event,
    Emitter<RegisterState> emit,
  ) async {
    final connectivityManager = getIt<ConnectivityHelper>();
    bool isNetworkConnected = await connectivityManager.isNetworkConnected();
    if (!isNetworkConnected) {
      emit(
        state.copyWith(
            status: BlocStatus.error,
            registerStatus: RegisterStatus.noInternetError),
      );
      emit(state.copyWith(
        status: BlocStatus.initial,
        registerStatus: RegisterStatus.initial,
      ));
      return;
    }

    bool isInvalidEmail = Validators.checkEmail(state.email).isNotEmpty;
    bool isInvalidPassword = Validators.checkPass(state.password).isNotEmpty;

    if (isInvalidEmail && !isInvalidPassword) {
      emit(state.copyWith(
        status: BlocStatus.error,
        registerStatus: RegisterStatus.isInvalidEmail,
      ));
      emit(state.copyWith(
        status: BlocStatus.initial,
        registerStatus: RegisterStatus.initial,
      ));
      return;
    } else if (!isInvalidEmail && isInvalidPassword) {
      emit(state.copyWith(
        status: BlocStatus.error,
        registerStatus: RegisterStatus.isInvalidPassword,
      ));
      emit(state.copyWith(
        status: BlocStatus.initial,
        registerStatus: RegisterStatus.initial,
      ));
      return;
    } else if (isInvalidEmail && isInvalidPassword) {
      emit(state.copyWith(
        status: BlocStatus.error,
        registerStatus: RegisterStatus.isInvalidEmailAndPassword,
      ));
      emit(state.copyWith(
        status: BlocStatus.initial,
        registerStatus: RegisterStatus.initial,
      ));
      return;
    }

    try {
      emit(state.copyWith(
          status: BlocStatus.loading, registerStatus: RegisterStatus.loading));
      await _authRepository.addAccount(
          email: state.email, password: state.password);
      emit(state.copyWith(
          status: BlocStatus.success, registerStatus: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: BlocStatus.error, registerStatus: RegisterStatus.error));
    }
  }
}

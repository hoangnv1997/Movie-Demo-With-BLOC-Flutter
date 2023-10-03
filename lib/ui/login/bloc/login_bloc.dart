import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedemo/common/bloc/base_state.dart';
import 'package:moviedemo/database/shared_preferences_helper.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/model/account/account_info.dart';
import 'package:moviedemo/repository/auth_repository.dart';
import 'package:moviedemo/utils/connectivity_manager.dart';
import 'package:moviedemo/utils/validator.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(const LoginState()) {
    on<LoginShowOrHidePass>(_onShowOrHidePass);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPressed>(_onLoginPressed);
  }

  void _onShowOrHidePass(
    LoginShowOrHidePass event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginPressed(
    LoginPressed event,
    Emitter<LoginState> emit,
  ) async {
    final connectivityManager = getIt<ConnectivityHelper>();
    bool isNetworkConnected = await connectivityManager.isNetworkConnected();
    if (!isNetworkConnected) {
      emit(
        state.copyWith(
            status: BlocStatus.error, loginStatus: LoginStatus.noInternetError),
      );
      return;
    }

    bool isInvalidEmail = Validators.checkEmail(state.email).isNotEmpty;
    bool isInvalidPassword = Validators.checkPass(state.password).isNotEmpty;

    if (isInvalidEmail && !isInvalidPassword) {
      emit(state.copyWith(
        status: BlocStatus.error,
        loginStatus: LoginStatus.isInvalidEmail,
      ));
      return;
    } else if (!isInvalidEmail && isInvalidPassword) {
      emit(state.copyWith(
        status: BlocStatus.error,
        loginStatus: LoginStatus.isInvalidPassword,
      ));
      return;
    } else if (isInvalidEmail && isInvalidPassword) {
      emit(state.copyWith(
        status: BlocStatus.error,
        loginStatus: LoginStatus.isInvalidEmailAndPassword,
      ));
      return;
    }

    try {
      var currentAcc =
          AccountInfo(email: state.email, password: state.password);
      emit(state.copyWith(
          status: BlocStatus.loading, loginStatus: LoginStatus.loading));

      final AccountInfo? accountInfo = await _authRepository.loginAccount(
          email: state.email, password: state.password);

      if (accountInfo == null) {
        emit(state.copyWith(
            status: BlocStatus.error, loginStatus: LoginStatus.isWrongEmail));
      } else if (accountInfo.password == currentAcc.password) {
        await SharedPreferencesHelper.setBoolType(
            SharedPreferencesHelper.keyLogged, true);

        emit(state.copyWith(
            status: BlocStatus.success, loginStatus: LoginStatus.success));
      } else {
        emit(state.copyWith(
            status: BlocStatus.error, loginStatus: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          status: BlocStatus.error, loginStatus: LoginStatus.error));
    }
  }
}

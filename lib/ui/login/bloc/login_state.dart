part of 'login_bloc.dart';

class LoginState extends BaseState {
  final String email;
  final String password;
  final bool isInvalidEmail;
  final bool isInvalidPassword;
  final bool isShowPassword;
  final LoginStatus loginStatus;

  final minPassLength = 6;
  final maxPassLength = 20;

  const LoginState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
    this.email = '',
    this.password = '',
    this.isInvalidEmail = false,
    this.isInvalidPassword = false,
    this.isShowPassword = false,
    this.loginStatus = LoginStatus.initial,
  }) : super(status: status, exception: exception);

  LoginState copyWith({
    BlocStatus? status,
    NetworkException? exception,
    String? email,
    String? password,
    bool? isInvalidEmail,
    bool? isInvalidPassword,
    bool? isShowPassword,
    LoginStatus? loginStatus,
  }) =>
      LoginState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
        email: email ?? this.email,
        password: password ?? this.password,
        isInvalidEmail: isInvalidEmail ?? this.isInvalidPassword,
        isInvalidPassword: isInvalidPassword ?? this.isInvalidPassword,
        isShowPassword: isShowPassword ?? this.isShowPassword,
        loginStatus: loginStatus ?? this.loginStatus,
      );

  bool isEnableRegisterButton() =>
      password.length >= minPassLength &&
      password.length <= maxPassLength &&
      email.isNotEmpty;

  @override
  List<Object?> get props => super.props
    ..addAll([
      email,
      password,
      isInvalidEmail,
      isInvalidPassword,
      isShowPassword,
      loginStatus,
    ]);
}

enum LoginStatus {
  initial,
  loading,
  success,
  noInternetError,
  error,
  isInvalidEmail,
  isInvalidPassword,
  isInvalidEmailAndPassword,
  isWrongEmail,
  isWrongPassword,
}

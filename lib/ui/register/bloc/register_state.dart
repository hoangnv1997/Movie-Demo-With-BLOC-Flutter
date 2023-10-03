part of 'register_bloc.dart';

class RegisterState extends BaseState {
  final String email;
  final String password;
  final bool isInvalidEmail;
  final bool isInvalidPassword;
  final bool isShowPassword;
  final RegisterStatus registerStatus;

  final minPassLength = 6;
  final maxPassLength = 20;

  const RegisterState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
    this.email = '',
    this.password = '',
    this.isInvalidEmail = false,
    this.isInvalidPassword = false,
    this.isShowPassword = false,
    this.registerStatus = RegisterStatus.initial,
  }) : super(status: status, exception: exception);

  RegisterState copyWith({
    BlocStatus? status,
    NetworkException? exception,
    String? email,
    String? password,
    bool? isInvalidEmail,
    bool? isInvalidPassword,
    bool? isShowPassword,
    RegisterStatus? registerStatus,
  }) =>
      RegisterState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
        email: email ?? this.email,
        password: password ?? this.password,
        isInvalidEmail: isInvalidEmail ?? this.isInvalidPassword,
        isInvalidPassword: isInvalidPassword ?? this.isInvalidPassword,
        isShowPassword: isShowPassword ?? this.isShowPassword,
        registerStatus: registerStatus ?? this.registerStatus,
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
      registerStatus,
    ]);
}

enum RegisterStatus {
  initial,
  loading,
  success,
  noInternetError,
  error,
  isInvalidEmail,
  isInvalidPassword,
  isInvalidEmailAndPassword,
}

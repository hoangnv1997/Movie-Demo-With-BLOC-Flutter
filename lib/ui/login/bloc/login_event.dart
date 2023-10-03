part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginShowOrHidePass extends LoginEvent {
  const LoginShowOrHidePass();

  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String? email;

  const LoginEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  const LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class LoginPressed extends LoginEvent {
  const LoginPressed();

  @override
  List<Object?> get props => [];
}

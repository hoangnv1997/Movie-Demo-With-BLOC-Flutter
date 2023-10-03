part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterShowOrHidePass extends RegisterEvent {
  const RegisterShowOrHidePass();

  @override
  List<Object?> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String? email;

  const RegisterEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String? password;

  const RegisterPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class RegisterPressed extends RegisterEvent {
  const RegisterPressed();

  @override
  List<Object?> get props => [];
}

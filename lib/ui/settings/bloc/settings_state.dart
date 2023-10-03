part of 'settings_bloc.dart';


 class SettingsState extends BaseState {
  const SettingsState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
  }) : super(status: status, exception: exception);

  SettingsState copyWith({
    BlocStatus? status,
    NetworkException? exception,
  }) =>
      SettingsState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
      );

  @override
  List<Object?> get props => super.props..addAll([]);
}
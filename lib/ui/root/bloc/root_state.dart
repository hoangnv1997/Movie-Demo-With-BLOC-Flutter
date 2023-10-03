part of 'root_bloc.dart';

class RootState extends BaseState {
  final int pageIndex;

  const RootState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
    this.pageIndex = 0,
  }) : super(status: status, exception: exception);

  RootState copyWith({
    BlocStatus? status,
    NetworkException? exception,
    int? pageIndex,
  }) =>
      RootState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
        pageIndex: pageIndex ?? this.pageIndex,
      );

  @override
  List<Object?> get props => super.props..addAll([pageIndex]);
}

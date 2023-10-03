part of 'trending_bloc.dart';

 class TrendingState extends BaseState {
  const TrendingState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
  }) : super(status: status, exception: exception);

  TrendingState copyWith({
    BlocStatus? status,
    NetworkException? exception,
  }) =>
      TrendingState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
      );

  @override
  List<Object?> get props => super.props..addAll([]);
}
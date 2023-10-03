part of 'search_bloc.dart';

 class SearchState extends BaseState {
  const SearchState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
  }) : super(status: status, exception: exception);

  SearchState copyWith({
    BlocStatus? status,
    NetworkException? exception,
  }) =>
      SearchState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
      );

  @override
  List<Object?> get props => super.props..addAll([]);
}
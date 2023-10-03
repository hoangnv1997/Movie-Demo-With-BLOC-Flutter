part of 'home_bloc.dart';

class HomeState extends BaseState {
  final int pageIndex;
  final ItemListResponse? itemListPopularResponse;
  final ItemListResponse? itemListNowPlayingResponse;
  final ItemListResponse? itemListTopRatedResponse;
  final ItemListResponse? itemListUpcomingResponse;

  const HomeState({
    BlocStatus status = BlocStatus.initial,
    NetworkException? exception,
    this.pageIndex = 0,
    this.itemListPopularResponse,
    this.itemListNowPlayingResponse,
    this.itemListTopRatedResponse,
    this.itemListUpcomingResponse,
  }) : super(status: status, exception: exception);

  HomeState copyWith({
    BlocStatus? status,
    NetworkException? exception,
    int? pageIndex,
    ItemListResponse? itemListPopularResponse,
    ItemListResponse? itemListNowPlayingResponse,
    ItemListResponse? itemListTopRatedResponse,
    ItemListResponse? itemListUpcomingResponse,
  }) =>
      HomeState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
        pageIndex: pageIndex ?? this.pageIndex,
        itemListPopularResponse:
            itemListPopularResponse ?? this.itemListPopularResponse,
        itemListNowPlayingResponse:
            itemListNowPlayingResponse ?? this.itemListNowPlayingResponse,
        itemListTopRatedResponse:
            itemListTopRatedResponse ?? this.itemListTopRatedResponse,
        itemListUpcomingResponse:
            itemListUpcomingResponse ?? this.itemListUpcomingResponse,
      );

  @override
  List<Object?> get props => super.props
    ..addAll([
      pageIndex,
      itemListPopularResponse,
      itemListNowPlayingResponse,
      itemListTopRatedResponse,
      itemListUpcomingResponse,
    ]);
}

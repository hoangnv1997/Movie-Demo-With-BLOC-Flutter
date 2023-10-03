import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedemo/common/bloc/base_state.dart';
import 'package:moviedemo/common/bloc/handle_call_api.dart';
import 'package:moviedemo/model/item_list_response/item_list_response.dart';
import 'package:moviedemo/repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(const HomeState()) {
    on<HomeFetched>(_onHomeFetched);
  }

  Future<void> _onHomeFetched(
    HomeFetched event,
    Emitter<HomeState> emit,
  ) async {
    await handleCallApi(
      onNoInternet: (exception) {
        emit(state.copyWith(status: BlocStatus.noInternetError));
      },
      onCallApi: () async {
        emit(state.copyWith(status: BlocStatus.loading));

        final response = await Future.wait([
          homeRepository.getMoviePopularList(page: 1),
          homeRepository.getMovieNowPlayingList(page: 1),
          homeRepository.getMovieTopRatedList(page: 1),
          homeRepository.getMovieUpcomingList(page: 1),
        ]);
        emit(state.copyWith(
          status: BlocStatus.success,
          itemListPopularResponse: response[0],
          itemListNowPlayingResponse: response[1],
          itemListTopRatedResponse: response[2],
          itemListUpcomingResponse: response[3],
        ));
      },
      onError: (exception) {
        emit(state.copyWith(status: BlocStatus.error));
      },
    );
  }
}

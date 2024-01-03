import 'package:get/get.dart';
import 'package:moviedemo/model/item_list_response/item_list_response.dart';
import 'package:moviedemo/repository/network_repository.dart';
import 'package:moviedemo/utils/call_api.dart';
import 'package:moviedemo/utils/url_end_point.dart';

abstract class HomeRepository {
  Future<ItemListResponse?> getMoviePopularList({required int page});

  Future<ItemListResponse?> getMovieNowPlayingList({required int page});

  Future<ItemListResponse?> getMovieTopRatedList({required int page});

  Future<ItemListResponse?> getMovieUpcomingList({required int page});
}

class HomeRepositoryImpl extends HomeRepository {
  final NetworkRepository networkRepository = Get.find();

  @override
  Future<ItemListResponse?> getMoviePopularList({required int page}) async {
    ItemListResponse? itemListResponse;

    await callApi<ItemListResponse>(
      methodCallApi: () =>
          networkRepository.get(endUrl: UrlEndPoint.moviePopular(page)),
      parsing: (Map<String, dynamic> data) => ItemListResponse.fromJson(data),
      onSuccess: (response) {
        itemListResponse = response;
      },
      onError: (exception) {
        throw exception;
      },
    );

    return itemListResponse;
  }

  @override
  Future<ItemListResponse?> getMovieNowPlayingList({required int page}) async {
    ItemListResponse? itemListResponse;

    await callApi<ItemListResponse>(
      methodCallApi: () =>
          networkRepository.get(endUrl: UrlEndPoint.movieNowPlaying(page)),
      parsing: (Map<String, dynamic> data) => ItemListResponse.fromJson(data),
      onSuccess: (response) {
        itemListResponse = response;
      },
      onError: (exception) {
        throw exception;
      },
    );

    return itemListResponse;
  }

  @override
  Future<ItemListResponse?> getMovieTopRatedList({required int page}) async {
    ItemListResponse? itemListResponse;

    await callApi<ItemListResponse>(
      methodCallApi: () =>
          networkRepository.get(endUrl: UrlEndPoint.movieTopRated(page)),
      parsing: (Map<String, dynamic> data) => ItemListResponse.fromJson(data),
      onSuccess: (response) {
        itemListResponse = response;
      },
      onError: (exception) {
        throw exception;
      },
    );

    return itemListResponse;
  }

  @override
  Future<ItemListResponse?> getMovieUpcomingList({required int page}) async {
    ItemListResponse? itemListResponse;

    await callApi<ItemListResponse>(
      methodCallApi: () =>
          networkRepository.get(endUrl: UrlEndPoint.movieUpcoming(page)),
      parsing: (Map<String, dynamic> data) => ItemListResponse.fromJson(data),
      onSuccess: (response) {
        itemListResponse = response;
      },
      onError: (exception) {
        throw exception;
      },
    );

    return itemListResponse;
  }
}

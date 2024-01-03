import 'package:get/get.dart';
import 'package:moviedemo/common/controller/base_controller.dart';
import 'package:moviedemo/model/item_list_response/item_list_response.dart';
import 'package:moviedemo/repository/home_repository.dart';
import 'package:moviedemo/utils/call_api.dart';

class HomeController extends BaseController {
  final HomeRepository homeRepository = Get.find();

  late final ItemListResponse? moviePopularList;

  late final ItemListResponse? movieNowPlayingList;

  late final ItemListResponse? movieTopRatedList;

  late final ItemListResponse? movieUpcomingList;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _onHomeFetched();
  }

  Future<void> _onHomeFetched() async {
    changeStatus(newStatus: Status.loading);
    await handleWithError(methodCallApi: () async {
      final response = await Future.wait([
        homeRepository.getMoviePopularList(page: 1),
        homeRepository.getMovieNowPlayingList(page: 1),
        homeRepository.getMovieTopRatedList(page: 1),
        homeRepository.getMovieUpcomingList(page: 1),
      ]);

      moviePopularList = response[0];
      movieNowPlayingList = response[1];
      movieTopRatedList = response[2];
      movieUpcomingList = response[3];
    });
    changeStatus(newStatus: Status.success);
  }
}

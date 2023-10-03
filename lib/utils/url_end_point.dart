import 'package:moviedemo/utils/const.dart';

class UrlEndPoint {
  static const apiKey = '';
  static const accessToken = '';

  static String moviePopular(int? page) =>
      '${Const.baseUrlDevelop}movie/popular?api_key=${apiKey}&page=$page';

  static String movieNowPlaying(int? page) =>
      '${Const.baseUrlDevelop}movie/now_playing?api_key=${apiKey}&page=$page';

  static String movieTopRated(int? page) =>
      '${Const.baseUrlDevelop}movie/top_rated?api_key=${apiKey}&page=$page';

  static String movieUpcoming(int? page) =>
      '${Const.baseUrlDevelop}movie/upcoming?api_key=${apiKey}&page=$page';
}

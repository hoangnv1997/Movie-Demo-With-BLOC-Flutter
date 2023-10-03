import 'package:flutter/material.dart';

class Const {
  static const screenDesignSize = Size(390, 844);

  static const String baseUrlDevelop = "https://api.themoviedb.org/3/";
  static const String baseUrlProduct = "https://api.themoviedb.org/3/";
  static const String baseBackdropUrl = "https://image.tmdb.org/t/p/w780";
  static const String basePosterUrl = "https://image.tmdb.org/t/p/w185";
  static const String baseProfileUrl = "https://image.tmdb.org/t/p/w185";

  /// Code response API
  static const int successNetworkCall = 200;
  static const int noInternet = 1000;
  static const int unknownErrorNetworkCall = 1001;

  /// Parsing network response error
  static const int parsingNetworkResponseError = 700;
}

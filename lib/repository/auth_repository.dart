import 'package:get/get.dart';
import 'package:moviedemo/model/http_raw/http_raw.dart';
import 'package:moviedemo/model/login_response/login_response.dart';
import 'package:moviedemo/repository/network_repository.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();

  Future<LoginResponse?> login({
    required String email,
    required String password,
  });

  void saveToken({required String token, required String accessToken});

  void removeToken();

  bool logOut();
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkRepository _networkRepository = Get.find();

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    return const LoginResponse(
        accessToken: 'accessToken', refreshToken: 'refreshToken');
    // LoginResponse? loginResponse;
    // await callApi<LoginResponse>(
    //     methodCallApi: () => fakeLogin(),
    //     parsing: (Map<String, dynamic> data) => LoginResponse.fromJson(data),
    //     onSuccess: (LoginResponse response) {
    //       loginResponse = response;
    //     },
    //     onError: (NetworkException exp) {
    //       throw exp;
    //     });
    //
    // return loginResponse ?? LoginResponse.empty();
  }

  /// Fake login
  Future<HttpRaw> fakeLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    return const HttpRaw(
      isSuccessCall: true,
      data: '''
    {
      "accessToken": "accessToken",
      "refreshToken": "refreshToken"
    }
    ''',
    );
  }

  @override
  void removeToken() {}

  @override
  void saveToken({required String token, required String accessToken}) {}

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }

  @override
  bool logOut() {
    return true;
  }
}

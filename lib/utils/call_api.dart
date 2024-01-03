import 'package:moviedemo/model/http_raw/http_raw.dart';
import 'package:moviedemo/model/network_exception/network_exception.dart';
import 'package:moviedemo/utils/const.dart';

Future<void> callApi<T extends Object>({
  required Future<HttpRaw> Function() methodCallApi,
  required T Function(Map<String, dynamic>) parsing,
  required Function(T) onSuccess,
  Function(NetworkException)? onError,
}) async {
  final HttpRaw result = await methodCallApi.call();
  if (result.isSuccessCall ?? false) {
    try {
      if (result.data == null) {
        onSuccess.call(Object() as T);
      } else {
        onSuccess.call(parsing.call(result.data));
      }
    } catch (e) {
      onError?.call(const NetworkException(
        code: Const.parsingNetworkResponseError,
        message: 'Parsing network response error',
      ));
    }
  } else {
    onError?.call(NetworkException.copyFromHttpRaw(result));
  }
}

Future<void> handleWithError({
  required Future<void> Function() methodCallApi,
  Function? onError,
  Function? onSuccess,
}) async {
  try {
    final result = await methodCallApi.call();
  } catch (exception) {
    onError?.call();
  }
}

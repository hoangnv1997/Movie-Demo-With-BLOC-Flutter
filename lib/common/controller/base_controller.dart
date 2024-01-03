import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final status = Status.success.obs;

  changeStatus({required Status newStatus}) => status.value = newStatus;

  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    changeStatus(newStatus: Status.loading);
    onStart?.call();
    try {
      final T response = await future;

      if (response != null) {
        onSuccess?.call(response);
        changeStatus(newStatus: Status.success);
      }

      return response;
    } catch (e) {
      changeStatus(newStatus: Status.error);
    }
  }
}

enum Status {
  initial,
  loading,
  success,
  loadMore,
  error,
}

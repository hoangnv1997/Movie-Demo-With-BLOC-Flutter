import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  /// Status of current state.
  final BlocStatus status;

  /// Error of a call api.
  final NetworkException? exception;

  const BaseState({this.status = BlocStatus.initial, this.exception});

  @override
  List<Object?> get props => [status, exception];
}

enum BlocStatus {
  initial,
  loading,
  success,
  loadMore,
  noInternetError,
  error,
  forceUpdate,
  forceLogout,
  maintenance,
  error400,
  error401,
  error403,
  error500,
  error700,
}

class HttpRaw {
  final bool? isSuccessCall;
  final dynamic data;
  final int? errorCode;
  final String errorMessage;

  const HttpRaw({
    this.isSuccessCall = false,
    this.data,
    this.errorCode = -1,
    this.errorMessage = '',
  });
}

class NetworkException {
  final int? code;
  final String? message;

  const NetworkException({this.code, this.message});

  factory NetworkException.copyFromHttpRaw(HttpRaw httpRaw) {
    return NetworkException(
      code: httpRaw.errorCode,
      message: httpRaw.errorMessage,
    );
  }
}

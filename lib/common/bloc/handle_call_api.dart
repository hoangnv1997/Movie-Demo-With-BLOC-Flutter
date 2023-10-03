import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moviedemo/common/bloc/base_state.dart';
import 'package:moviedemo/common/widget/info_dialog.dart';
import 'package:moviedemo/common/widget/no_connection_dialog.dart';
import 'package:moviedemo/generated/l10n.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/main/my_app.dart';
import 'package:moviedemo/utils/connectivity_manager.dart';
import 'package:moviedemo/utils/const.dart';

typedef ErrorCallback = void Function(NetworkException e);

bool isDialogShowing = false;

Future<void> handleCallApi({
  required AsyncCallback onCallApi,
  ErrorCallback? onNoInternet,
  ErrorCallback? onError,
  bool handleErrorCode = false,
  bool shouldShowDialogNotConnectionBeforeCallApi = true,
  bool shouldDefaultErrorDialogWhenCallApi = false,
  VoidCallback? actionReload,
  bool isDisplayReloadButtonInsteadOfOK = false,
}) async {
  final connectivityManager = getIt<ConnectivityHelper>();
  bool isNetworkConnected = await connectivityManager.isNetworkConnected();
  if (!isNetworkConnected) {
    if (shouldShowDialogNotConnectionBeforeCallApi) {
      _showNoConnectionDialog(action: actionReload);
    }
    onNoInternet?.call(const NetworkException(code: Const.noInternet));
    return;
  }
  try {
    await onCallApi.call();
  } on NetworkException catch (e) {
    if (shouldDefaultErrorDialogWhenCallApi) {
      _showDefaultErrorDialog(
        message: e.message ?? S.current.unknown_error,
        action: actionReload,
        isDisplayReloadButtonInsteadOfOK: isDisplayReloadButtonInsteadOfOK,
      );
    }
    onError?.call(e);
  } catch (e) {
    if (shouldDefaultErrorDialogWhenCallApi) {
      _showDefaultErrorDialog(
        message: S.current.unknown_error,
        action: actionReload,
        isDisplayReloadButtonInsteadOfOK: isDisplayReloadButtonInsteadOfOK,
      );
    }
    onError?.call(NetworkException(
        code: Const.unknownErrorNetworkCall, message: S.current.unknown_error));
  }
}

void _showNoConnectionDialog({Function()? action}) {
  final BuildContext? buildContext = navigatorKey.currentState?.context;
  if (buildContext != null && !isDialogShowing) {
    isDialogShowing = true;
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: buildContext,
      builder: (context) {
        return NoConnectionDialog(action: action);
      },
    ).then((_) => isDialogShowing = false);
  }
}

void _showDefaultErrorDialog({
  required String message,
  Function()? action,
  bool isDisplayReloadButtonInsteadOfOK = false,
}) {
  final BuildContext? buildContext = navigatorKey.currentState?.context;
  if (buildContext != null && !isDialogShowing) {
    isDialogShowing = true;
    showDialog(
      context: buildContext,
      builder: (context) {
        return InfoDialog(
            action: isDisplayReloadButtonInsteadOfOK ? action : null,
            title: S.current.notice,
            content: message,
            textButtonAction: isDisplayReloadButtonInsteadOfOK
                ? S.current.reload
                : S.current.ok);
      },
    ).then((_) => isDialogShowing = false);
  }
}

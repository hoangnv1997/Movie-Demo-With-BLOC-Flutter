import 'package:flutter/material.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/utils/keyboard.dart';

Widget buildBasePage({
  required Widget body,
  Color backgroundColor = AppColor.white,
  PreferredSizeWidget? appBar,
  bool? extendBodyBehindAppBar,
  bool? resizeToAvoidBottomInset,
  bool showFloatingActionButton = false,
  bool showDrawer = true,
  VoidCallback? floatingButtonAction,
  Widget? bottomNavigationBar,
}) {
  return GestureDetector(
    onTap: () {
      hideKeyboard();
    },
    child: Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    ),
  );
}

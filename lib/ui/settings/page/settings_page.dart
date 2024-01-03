import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/ui/settings/controller/settings_controller.dart';

class SettingsPage extends BasePage<SettingsController> {
  SettingsPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      toolbarHeight: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text('Settings Page'),
    );
  }
}

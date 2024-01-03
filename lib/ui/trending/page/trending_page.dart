import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/ui/trending/controller/trending_controller.dart';

class TrendingPage extends BasePage<TrendingController> {
  TrendingPage({Key? key}) : super(key: key);

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
      child: Text('Trending Page'),
    );
  }
}

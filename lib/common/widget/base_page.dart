import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/controller/base_controller.dart';
import 'package:moviedemo/common/widget/error_widget.dart';
import 'package:moviedemo/common/widget/loading_progress.dart';
import 'package:moviedemo/utils/keyboard.dart';

abstract class BasePage<Controller extends BaseController>
    extends GetView<Controller> {
  BasePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context) => null;

  Widget? bottomNavigationBar() => null;

  Widget? drawer() => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: Scaffold(
        appBar: appBar(context),
        backgroundColor: getPageBackgroundColor(),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
        body: pageBody(context),
        bottomNavigationBar: bottomNavigationBar(),
        drawer: drawer(),
      ),
    );
  }

  Widget pageBody(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        final status = controller.status.value;
        switch (status) {
          case Status.loading:
            if (isShowLoadingPage()) {
              return buildLoadingWidget();
            } else {
              return body(context);
            }
          case Status.success:
            return body(context);
          case Status.error:
            return buildErrorWidget();
          case Status.initial:
            return const SizedBox();
          default:
            return Container();
        }
      }),
    );
  }

  bool extendBodyBehindAppBar() => false;

  bool isShowLoadingPage() => false;

  bool? resizeToAvoidBottomInset() => null;

  Color getPageBackgroundColor() => AppColor.white;

  Color getStatusBarColor() => AppColor.transparent;

  Brightness getBrightness() => Brightness.light;

  Brightness getBrightnessStatusBarIcon() => Brightness.dark;

  Widget buildLoadingWidget() => const LoadingProgress();

  Widget buildErrorWidget() => const ErrorView();
}

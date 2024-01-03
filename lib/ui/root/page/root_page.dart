import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/ui/home/page/home_page.dart';
import 'package:moviedemo/ui/root/controller/root_controller.dart';
import 'package:moviedemo/ui/search/page/search_page.dart';
import 'package:moviedemo/ui/settings/page/settings_page.dart';
import 'package:moviedemo/ui/trending/page/trending_page.dart';

class RootPage extends BasePage<RootController> {
  RootPage({Key? key}) : super(key: key);

  @override
  Color getPageBackgroundColor() => AppColor.black;

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

  Widget _buildBodyWidget() {
    var pageList = [HomePage(), TrendingPage(), SearchPage(), SettingsPage()];
    PageController pageController = PageController();

    return Obx(() {
      print('hoangnv builder ${controller.pageIndex}');
      if (pageController.hasClients) {
        pageController.jumpToPage(controller.pageIndex.value);
      }
      return IndexedStack(
        index: controller.pageIndex.value,
        children: pageList,
      );
    });
  }

  @override
  Widget? bottomNavigationBar() {
    // TODO: implement bottomNavigationBar
    return Obx(
      () {
        return GNav(
          gap: 5.w,
          color: AppColor.white,
          activeColor: AppColor.white,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.trending_up,
              text: 'Trending',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            )
          ],
          onTabChange: (index) {
            print('$index');
            controller.pageIndex.value = index;
          },
          selectedIndex: controller.pageIndex.value,
        );
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return _buildBodyWidget();
  }
}

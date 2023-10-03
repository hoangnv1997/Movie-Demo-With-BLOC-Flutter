import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moviedemo/common/bloc/bloc_consumer_creation.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/main/main_develop.dart';
import 'package:moviedemo/ui/home/page/home_page.dart';
import 'package:moviedemo/ui/root/bloc/root_bloc.dart';
import 'package:moviedemo/ui/search/page/search_page.dart';
import 'package:moviedemo/ui/settings/page/settings_page.dart';
import 'package:moviedemo/ui/trending/page/trending_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RootBloc>(),
      child: buildBasePage(
        appBar: _buildAppBar(context),
        backgroundColor: AppColor.black,
        body: _buildBodyWidget(),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
    const pageList = [HomePage(), TrendingPage(), SearchPage(), SettingsPage()];
    PageController pageController = PageController();

    return createBlocConsumer<RootEvent, RootState, RootBloc>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        print('hoangnv builder ${state.pageIndex}');
        if (pageController.hasClients) {
          pageController.jumpToPage(state.pageIndex);
        }
        return IndexedStack(
          index: state.pageIndex,
          children: pageList,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
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
            context.read<RootBloc>().add(PageChanged(pageIndex: index));
          },
          selectedIndex: state.pageIndex,
        );
      },
    );
  }
}

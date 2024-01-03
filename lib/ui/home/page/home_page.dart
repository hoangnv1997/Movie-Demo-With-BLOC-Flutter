import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/controller/base_controller.dart';
import 'package:moviedemo/common/widget/base_page.dart';
import 'package:moviedemo/model/item_list_response/item_list_response.dart';
import 'package:moviedemo/ui/home/controller/home_controller.dart';
import 'package:moviedemo/ui/home/widget/movie_item.dart';

class HomePage extends BasePage<HomeController> {
  HomePage({Key? key}) : super(key: key);

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
  Color getPageBackgroundColor() => AppColor.black;

  Widget _buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        title,
        style: TextStyle(color: AppColor.white, fontSize: 20.sp),
      ),
    );
  }

  Widget _buildItemList(
      BuildContext context, ItemListResponse? itemListResponse) {
    return Container(
      height: 200.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: itemListResponse?.items?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return MovieItem(
            item: itemListResponse!.items![index],
          );
        },
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    if (controller.status.value == Status.success
        // && state.itemListPopularResponse != null
        ) {
      return RefreshIndicator(
        onRefresh: () {
          // context.read<HomeBloc>().add(HomeFetched());
          return Future<void>.delayed(const Duration(milliseconds: 100));
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.w),
              _buildTitle('Popular'),
              SizedBox(height: 5.w),
              _buildItemList(context, controller.moviePopularList),
              SizedBox(height: 5.w),
              _buildTitle('Now Playing'),
              SizedBox(height: 5.w),
              _buildItemList(context, controller.movieNowPlayingList),
              SizedBox(height: 5.w),
              _buildTitle('Top Rated'),
              SizedBox(height: 5.w),
              _buildItemList(context, controller.movieTopRatedList),
              SizedBox(height: 5.w),
              _buildTitle('Upcoming'),
              SizedBox(height: 5.w),
              _buildItemList(context, controller.movieUpcomingList),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviedemo/common/color/app_color.dart';
import 'package:moviedemo/common/image/app_images.dart';
import 'package:moviedemo/model/item_list_response/item_list_response.dart';
import 'package:moviedemo/utils/const.dart';

class MovieItem extends StatelessWidget {
  final Item item;

  const MovieItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 120.w,
                height: 160.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.w)),
                  child: CachedNetworkImage(
                    imageUrl: '${Const.basePosterUrl}${item.posterPath}',
                    placeholder: (context, url) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 60.w, horizontal: 40.w),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          color: AppColor.white,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset(AppImages.movieDefault);
                    },
                    fadeOutDuration: const Duration(seconds: 1),
                    fadeInDuration: const Duration(seconds: 2),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                width: 120.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
                  child: Text(
                    '${item.title}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColor.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: double.infinity,
            width: 10.w,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedemo/common/color/app_color.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.white,
      ),
    );
  }
}

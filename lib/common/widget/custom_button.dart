import 'package:flutter/material.dart';
import 'package:moviedemo/common/color/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColorEnable;
  final Color textColorDisable;
  final double textSize;
  final VoidCallback? action;
  final Color backgroundColorEnable;
  final Color backgroundColorDisable;
  final Color? shadowColor;
  final bool enable;
  final bool isLoading;
  final double radiusBorder;
  final double heightButton;
  final bool continueHandlePressIfDisable;
  final Widget? icon;

  const CustomButton({
    Key? key,
    required this.text,
    this.textColorEnable = AppColor.black,
    this.textColorDisable = AppColor.black,
    this.action,
    this.isLoading = false,
    this.textSize = 17,
    this.backgroundColorEnable = AppColor.white,
    this.backgroundColorDisable = AppColor.opalSolid,
    this.shadowColor,
    this.enable = false,
    this.radiusBorder = 118,
    this.heightButton = 56,
    this.icon,
    this.continueHandlePressIfDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ((!enable || isLoading) && !continueHandlePressIfDisable) return;
        action?.call();
      },
      child: Container(
        height: heightButton,
        decoration: BoxDecoration(
            color: enable ? backgroundColorEnable : backgroundColorDisable,
            borderRadius: BorderRadius.all(
              Radius.circular(radiusBorder),
            ),
            boxShadow: shadowColor != null && enable
                ? [
                    BoxShadow(
                      color: shadowColor!,
                      spreadRadius: 2,
                      blurRadius: 8,
                    )
                  ]
                : null),
        child: Center(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.black,
                  ),
                )
              : Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) icon!,
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            fontSize: textSize,
                            color: enable ? textColorEnable : textColorDisable),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

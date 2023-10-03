import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviedemo/common/color/app_color.dart';

class InputForm extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hint;
  final double? borderRadius;
  final bool isBorderLeft;
  final double? borderSideWidth;
  final Color? borderSideColor;
  final bool obscureText;
  final TextInputType? textInputType;
  final int? maxLength;
  final Color cursorColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final bool enable;
  final double? contentPaddingTop;
  final double? contentPaddingBottom;
  final double? contentPaddingLeft;
  final double? contentPaddingRight;
  final double? fontSize;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final InputBorder? disabledBorder;

  const InputForm({
    Key? key,
    this.controller,
    this.onChanged,
    this.hint = '',
    this.borderRadius,
    this.isBorderLeft = false,
    this.borderSideWidth,
    this.borderSideColor,
    this.obscureText = false,
    this.textInputType,
    this.maxLength,
    this.enable = true,
    this.cursorColor = Colors.black,
    this.inputFormatters,
    this.hintTextStyle,
    this.textStyle,
    this.contentPaddingTop,
    this.contentPaddingBottom,
    this.contentPaddingLeft,
    this.contentPaddingRight,
    this.fontSize,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.disabledBorder,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign,
      enabled: widget.enable,
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        suffixIconConstraints: widget.suffixIconConstraints,
        disabledBorder: OutlineInputBorder(
          borderRadius: widget.isBorderLeft
              ? BorderRadius.only(
                  topLeft: Radius.circular(widget.borderRadius ?? 30.w),
                  bottomLeft: Radius.circular(widget.borderRadius ?? 30.w))
              : BorderRadius.circular(widget.borderRadius ?? 30.w),
          borderSide: widget.borderSideWidth != null
              ? BorderSide(
                  width: widget.borderSideWidth ?? 1,
                  style: BorderStyle.solid,
                  color: widget.borderSideColor ?? AppColor.gray)
              : BorderSide.none,
        ),
        suffixIcon: widget.suffixIcon,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.isBorderLeft
              ? BorderRadius.only(
                  topLeft: Radius.circular(widget.borderRadius ?? 30.w),
                  bottomLeft: Radius.circular(widget.borderRadius ?? 30.w))
              : BorderRadius.circular(widget.borderRadius ?? 30.w),
          borderSide: widget.borderSideWidth != null
              ? BorderSide(
                  width: widget.borderSideWidth ?? 1,
                  style: BorderStyle.solid,
                  color: widget.borderSideColor ?? AppColor.gray)
              : BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: widget.isBorderLeft
              ? BorderRadius.only(
                  topLeft: Radius.circular(widget.borderRadius ?? 30.w),
                  bottomLeft: Radius.circular(widget.borderRadius ?? 30.w))
              : BorderRadius.circular(widget.borderRadius ?? 30.w),
          borderSide: widget.borderSideWidth != null
              ? BorderSide(
                  width: widget.borderSideWidth ?? 1,
                  style: BorderStyle.solid,
                  color: widget.borderSideColor ?? AppColor.gray)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.isBorderLeft
              ? BorderRadius.only(
                  topLeft: Radius.circular(widget.borderRadius ?? 30.w),
                  bottomLeft: Radius.circular(widget.borderRadius ?? 30.w))
              : BorderRadius.circular(widget.borderRadius ?? 30.w),
          borderSide: widget.borderSideWidth != null
              ? BorderSide(
                  width: widget.borderSideWidth ?? 1,
                  style: BorderStyle.solid,
                  color: widget.borderSideColor ?? AppColor.gray)
              : BorderSide.none,
        ),
        hintText: widget.hint,
        hintStyle: widget.hintTextStyle,
        contentPadding: EdgeInsets.only(
            left: widget.contentPaddingLeft ?? 16.w,
            right: widget.contentPaddingRight ?? 16.w,
            top: widget.contentPaddingTop ?? 16.w,
            bottom: widget.contentPaddingBottom ?? 16.w),
      ),
      obscureText: widget.obscureText,
      style: widget.textStyle,
      cursorColor: widget.cursorColor,
    );
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class UtilsHelper {
  static showSnackBar({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}

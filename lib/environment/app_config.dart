import 'package:flutter/material.dart';

enum Environment { product, develop }

class AppConfig extends InheritedWidget {
  final Environment environment;
  final String baseUrl;

  const AppConfig({
    Key? key,
    required this.environment,
    required this.baseUrl,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static AppConfig of(BuildContext buildContext) {
    return buildContext.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }
}

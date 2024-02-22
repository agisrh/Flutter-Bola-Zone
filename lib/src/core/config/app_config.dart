import 'package:flutter/material.dart';
import 'package:bola_zone/src/core/export_helper.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    super.key,
    required this.appName,
    required this.debugTag,
    required this.flavorName,
    required this.initialRoute,
    required Widget child,
    required this.env,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final String initialRoute;
  final bool debugTag;
  final Environment env;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

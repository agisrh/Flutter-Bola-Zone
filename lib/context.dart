import 'dart:math';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  BuildContext get getContext => this;

  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  TextTheme get appTextTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get minScreenSize => min(
        MediaQuery.of(this).size.height,
        MediaQuery.of(this).size.width,
      );

  double get maxScreenSize => max(
        MediaQuery.of(this).size.height,
        MediaQuery.of(this).size.width,
      );
}

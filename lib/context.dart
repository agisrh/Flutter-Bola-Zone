import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  BuildContext get getContext => this;

  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  TextTheme get appTextTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get minScreenSize => min(screenHeight, screenWidth);

  double get maxScreenSize => max(screenHeight, screenWidth);
}

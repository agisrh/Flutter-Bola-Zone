import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

// ignore: deprecated_member_use
Size size = WidgetsBinding.instance.window.physicalSize;

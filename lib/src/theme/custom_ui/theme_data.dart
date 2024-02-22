import 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppsTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: AppsTheme.color.primaryGreen,
    //textTheme: GoogleFonts.lexendDecaTextTheme(),
    scaffoldBackgroundColor: AppsTheme.color.neutral.shade300,
  );
  static AppsColor color = AppsColor();
}

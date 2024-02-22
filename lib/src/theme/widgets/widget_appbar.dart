import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/app_theme.dart';

class AppsBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color? textColor;
  final Function()? onBackPressed;
  final Color? color;
  final bool? centerTitle;
  final Widget? action;
  const AppsBar({
    Key? key,
    required this.text,
    this.onBackPressed,
    this.color,
    this.textColor,
    this.centerTitle = false,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? AppsTheme.color.neutral.shade100,
      shadowColor: AppsTheme.color.neutral.shade200,
      elevation: 0.5,
      centerTitle: centerTitle,
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: textColor ?? AppsTheme.color.neutral.shade800,
        ),
      ),
      actions: action != null
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: action!,
              )
            ]
          : null,
      leading: Navigator.canPop(context)
          ? Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: InkWell(
                onTap: () {
                  if (onBackPressed != null) {
                    onBackPressed!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Icon(
                  Icons.arrow_back,
                  color: textColor ?? AppsTheme.color.neutral.shade100,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

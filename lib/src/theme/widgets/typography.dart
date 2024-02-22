import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/app_theme.dart';

class TitleLabel extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final String linkText;
  final Color? colorText;
  final Color? colorLink;
  const TitleLabel({
    super.key,
    required this.text,
    this.onTap,
    this.linkText = 'See all',
    this.colorText,
    this.colorLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colorText ?? Colors.black,
          ),
        ),
        if (onTap != null)
          GestureDetector(
            onTap: () {
              onTap!();
            },
            child: Row(
              children: [
                Text(
                  linkText,
                  style: TextStyle(
                      color: colorLink ?? AppsTheme.color.primaryGreen),
                ),
                5.width,
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: colorLink ?? AppsTheme.color.primaryGreen,
                ),
              ],
            ),
          )
      ],
    );
  }
}

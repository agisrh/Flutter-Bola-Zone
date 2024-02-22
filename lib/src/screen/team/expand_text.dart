import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String firstHalf = "";
  String secondHalf = "";
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 400) {
      firstHalf = widget.text.substring(0, 400);
      secondHalf = widget.text.substring(400, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              textAlign: TextAlign.justify,
            )
          : Column(
              children: <Widget>[
                Text(
                  flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "Show more" : "Show less",
                        style: TextStyle(color: AppsTheme.color.primaryGreen),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}

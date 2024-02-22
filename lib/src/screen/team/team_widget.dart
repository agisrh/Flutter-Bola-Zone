import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget statistic({required String text}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 3,
    ),
    decoration: BoxDecoration(
      color: AppsTheme.color.primaryBlue.shade100,
      borderRadius: const BorderRadius.all(Radius.circular(3)),
      border: Border.all(
        color: AppsTheme.color.primaryBlue,
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppsTheme.color.primaryBlue,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget roundedMenu(Icon icon, Text text) {
  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: AppsTheme.color.primaryGreen.shade400,
        ),
        child: IconButton(
          onPressed: () {},
          icon: icon,
          color: Colors.white,
          iconSize: 30,
        ),
      ),
      const SizedBox(height: 10),
      text
    ],
  );
}

Widget playerCard({required PlayerModel player}) {
  return Container(
    //padding: EdgeInsets.all(10),
    //margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      //border: Border.all(color: AppsTheme.color.neutral.shade300, width: 0.5),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Image.network(
                        player.playerPhoto,
                        height: 120,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return SizedBox(
                            height: 50,
                            child: Assets.images.blankProfile.image(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: 50,
                            child: Assets.images.blankProfile.image(),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          player.playerName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5.0, bottom: 15.0),
                          child: Text(
                            player.position,
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                        Text(
                          player.playerNumber,
                          style: const TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

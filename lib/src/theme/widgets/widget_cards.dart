import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/app_theme.dart';

class MatchdayCard extends StatelessWidget {
  final MatchModel match;
  const MatchdayCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final venue = match.venue!.split(',');
    return Container(
      decoration: BoxDecoration(
        color: AppsTheme.color.primaryBlue.shade800,
        image: DecorationImage(
          image: AssetImage(Assets.images.briLiga1.path),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Text(
            '${venue[0]},',
            style: TextStyle(
              fontSize: 10,
              color: AppsTheme.color.neutral.shade100,
            ),
          ),
          if (venue.length > 1)
            Text(
              venue[1],
              style: TextStyle(
                fontSize: 10,
                color: AppsTheme.color.neutral.shade100,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _matchClub(
                  urlLogo: match.homeClubLogo!, teamName: match.homeClub!),
              Column(
                children: [
                  Text(
                    match.score ?? "-",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppsTheme.color.neutral.withOpacity(0.2),
                      border: Border.all(
                        color: AppsTheme.color.neutral,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Text(
                      match.time ?? "-",
                      style: TextStyle(
                        color: AppsTheme.color.neutral.shade100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              _matchClub(
                  urlLogo: match.awayClubLogo!, teamName: match.awayClub!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _matchClub({required String teamName, required String urlLogo}) {
    return SizedBox(
      width: ScreenUtil().screenWidth / 3.5,
      child: Column(
        children: [
          Image.network(
            urlLogo,
            height: 80,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                height: 80,
                width: 80,
                child: Assets.images.shield.image(),
              );
            },
          ),
          // ShimmerImage(
          //   urlLogo,
          //   height: 80,
          // ),
          20.height,
          Text(
            teamName,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class NextMatchCard extends StatelessWidget {
  final MatchModel match;
  final String? date;
  final bool showScore;
  const NextMatchCard({
    super.key,
    required this.match,
    this.date,
    this.showScore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      '${match.homeClub}',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ),
                  Image.network(
                    '${match.homeClubLogo}',
                    height: 50,
                    width: 50,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 35,
                        width: 35,
                        child: Assets.images.shield.image(),
                      );
                    },
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8.h),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppsTheme.color.primaryGreen.withOpacity(0.2),
                  border: Border.all(
                    color: AppsTheme.color.primaryGreen,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(
                  (showScore && match.time == 'FT')
                      ? '${match.score}'.toUpperCase()
                      : ' VS ',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppsTheme.color.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Image.network(
                    '${match.awayClubLogo}',
                    height: 50,
                    width: 50,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 35,
                        width: 35,
                        child: Assets.images.shield.image(),
                      );
                    },
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      '${match.awayClub}',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(children: [
              if (date != null)
                Text(
                  '$date, ${match.time} WIB',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppsTheme.color.neutral.shade600,
                  ),
                ),
              if (date == null && match.time != 'FT')
                Text(
                  '${match.time} WIB',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppsTheme.color.neutral.shade600,
                  ),
                ),
              Text(
                '${match.venue}',
                style: TextStyle(
                  fontSize: 10,
                  color: AppsTheme.color.neutral.shade600,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

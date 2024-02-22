import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/routes/router.dart';
import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentSlide = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsTheme.color.neutral.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.images.bolaZone.image(
                          width: 150,
                          color: AppsTheme.color.primaryGreen.shade600,
                        ),
                        // Text(
                        //   'Bola Zone',
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                      ],
                    ),
                    //Icon(Icons.notification_add)
                  ],
                ),
              ),
            ),
            BlocBuilder<MatchBloc, MatchState>(
              builder: (context, state) {
                if (state is MatchLoading) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: const ShimmerWidget(
                      height: 200,
                      borderRadius: 16,
                    ),
                  );
                }
                if (state is MatchSuccess) {
                  List<MatchModel> match3data =
                      state.matchFilter.getRange(0, 3).toList(); // get 3 data
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _buildLastMatch(match3data),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            30.height,
            //_buildServices(),
            SizedBox(
              height: 100,
              child: GridView.count(
                crossAxisCount: 1,
                scrollDirection: Axis.horizontal,
                mainAxisSpacing: 15.0,
                padding: const EdgeInsets.only(left: 15),
                childAspectRatio: 1.2,
                children: List.generate(
                  services().length,
                  (index) {
                    ServiceModel service = services()[index];
                    return GestureDetector(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppsTheme.color.neutral.shade400,
                            radius: 35,
                            child: Image.asset(service.icon, height: 45),
                          ),
                          8.height,
                          Text(
                            service.name,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      onTap: () => context.goNamed(service.route),
                    );
                  },
                ),
              ),
            ),
            30.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TitleLabel(
                  text: 'Upcoming Match',
                  onTap: () {
                    context.goNamed(Routes.nextMatch);
                  }),
            ),
            BlocBuilder<NextMatchBloc, NextMatchState>(
              builder: (context, state) {
                if (state is NextMatchLoading) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 15.height,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: const ShimmerWidget(height: 100),
                        );
                      },
                    ),
                  );
                }
                if (state is NextMatchSuccess) {
                  List<MatchModel> match3data =
                      state.matchFilter.getRange(0, 3).toList(); // get 3 data
                  return _buildNextMatch(
                    matchdata: match3data,
                    date: state.matches.first.date ?? "",
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastMatch(List<MatchModel> matchdata) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: matchdata.length,
          itemBuilder: (context, index, realIndex) {
            MatchModel lastMatch = matchdata[index];
            return MatchdayCard(match: lastMatch);
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: matchdata.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currentSlide == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildNextMatch(
      {required List<MatchModel> matchdata, required String date}) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => 15.height,
        itemCount: matchdata.length,
        itemBuilder: (context, index) {
          MatchModel nextMatch = matchdata[index];
          return NextMatchCard(match: nextMatch, date: date);
        },
      ),
    );
  }

  // Widget _buildServices() {
  //   return SizedBox(
  //     height: 60,
  //     child: ListView.builder(
  //       padding: const EdgeInsets.symmetric(horizontal: 16),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: services().length,
  //       itemBuilder: (context, index) {
  //         ServiceModel service = services()[index];
  //         return Container(
  //           clipBehavior: Clip.hardEdge,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //           ),
  //           margin:
  //               EdgeInsets.only(right: services().length - 1 == index ? 0 : 8),
  //           child: Stack(
  //             children: [
  //               SizedBox(
  //                 width: 115,
  //                 height: 60,
  //                 child: ShimmerImage(
  //                   service.image,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               Positioned(
  //                 top: 0,
  //                 left: 0,
  //                 right: 0,
  //                 bottom: 0,
  //                 child: Container(
  //                   height: 80,
  //                   decoration: BoxDecoration(
  //                     color: Colors.black.withAlpha(110),
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       service.name,
  //                       textAlign: TextAlign.center,
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.w400,
  //                         letterSpacing: 1,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}

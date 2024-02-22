import 'package:bola_zone/context.dart';
import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/src/screen/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:bola_zone/src/theme/widgets/widgets.dart';

class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'Standings',
        textColor: AppsTheme.color.neutral.shade100,
        color: AppsTheme.color.primaryGreen,
      ),
      backgroundColor: AppsTheme.color.neutral.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.screenWidth / 2.5,
                        child: Text(
                          'Club',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: AppsTheme.color.primaryGreen,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth / 1.9,
                        child: Row(
                          children: [
                            boxPoint('M', title: true),
                            boxPoint('W', title: true),
                            boxPoint('D', title: true),
                            boxPoint('L', title: true),
                            boxPoint('P', title: true),
                            boxPoint('G', title: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          Expanded(
            child: BlocBuilder<StandingBloc, StandingState>(
              builder: (context, state) {
                if (state is MatchError) {
                  return const Center(
                    child: ErrorScreen(),
                  );
                }
                if (state is StandingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is StandingSuccess) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => 15.height,
                    itemCount: state.standings.length,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 5.w),
                    itemBuilder: (context, index) {
                      StandingModel data = state.standings[index];
                      int lastThree = state.standings.length - 3;
                      return _items(
                        context: context,
                        index: index,
                        data: data,
                        lastThree: lastThree,
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('No Data'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _items({
    required BuildContext context,
    required int index,
    required StandingModel data,
    required int lastThree,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: index < 3
                    ? AppsTheme.color.primaryGreen
                    : index >= lastThree
                        ? Colors.red
                        : Colors.transparent,
                width: 3,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenWidth / 2.5,
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: index < 9 ? 5.0 : 0.0),
                      child: Image.network(
                        data.logo,
                        height: 30,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return SizedBox(
                            height: 25,
                            width: 25,
                            child: Assets.images.shield.image(),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        data.club,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.screenWidth / 1.9,
                child: Row(
                  children: [
                    boxPoint(data.matches),
                    boxPoint(data.win.toString()),
                    boxPoint(data.draw.toString()),
                    boxPoint(data.lose.toString()),
                    boxPoint(data.points.toString()),
                    boxPoint(data.goals.toString(), width: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }

  Widget boxPoint(String value, {bool title = false, double width = 30}) {
    return SizedBox(
      width: width,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: title ? FontWeight.bold : FontWeight.normal,
          color: title ? AppsTheme.color.primaryGreen : Colors.black,
        ),
      ),
    );
  }
}

import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/app_theme.dart';

class TeamGoalTab extends StatelessWidget {
  const TeamGoalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child:
          BlocBuilder<TeamGoalBloc, TeamGoalState>(builder: (context, state) {
        if (state is TeamGoalLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TeamGoalSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemCount: state.listTeamGoal.length,
            itemBuilder: (BuildContext context, int index) {
              TeamStatisticModel data = state.listTeamGoal[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text((index + 1).toString()),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: index < 9 ? 15.0 : 10.0,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(data.clubLogo),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.club),
                              SizedBox(height: 5.h),
                              Text(
                                'Play : ${data.play} | Goal Average : ${data.average}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppsTheme.color.neutral.shade600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          data.goal,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppsTheme.color.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(thickness: 1),
                ],
              );
            },
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      }),
    );
  }
}

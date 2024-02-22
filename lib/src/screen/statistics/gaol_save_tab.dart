import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:flutter/material.dart';
import 'package:bola_zone/src/theme/app_theme.dart';

class GoalSaveTab extends StatelessWidget {
  const GoalSaveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child:
          BlocBuilder<GoalSaveBloc, GoalSaveState>(builder: (context, state) {
        if (state is GoalSaveLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GoalSaveSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemCount: state.listGoalSave.length,
            itemBuilder: (BuildContext context, int index) {
              PlayerStatisticModel data = state.listGoalSave[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text((index + 1).toString()),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(data.avatar),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Image.network(
                                    data.clubLogo,
                                    height: 20,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Assets.images.shield.image(),
                                      );
                                    },
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Play : ${data.play}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppsTheme.color.neutral.shade600,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          '${data.total}',
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

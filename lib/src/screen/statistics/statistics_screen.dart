import 'package:bola_zone/src/screen/statistics/gaol_save_tab.dart';
import 'package:bola_zone/src/screen/statistics/goal_tab.dart';
import 'package:bola_zone/src/screen/statistics/red_card_tab.dart';
import 'package:bola_zone/src/screen/statistics/success_passes_tab.dart';
import 'package:bola_zone/src/screen/statistics/team_goal_tab.dart';
import 'package:bola_zone/src/screen/statistics/yellow_card_tab.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              title: Text('Statistics'),
              pinned: true,
              floating: true,
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(child: Text('Goal')),
                  Tab(child: Text('Yellow Card')),
                  Tab(child: Text('Red Card')),
                  Tab(child: Text('Team Top Goal')),
                  Tab(child: Text('Goal Keeper Save')),
                  Tab(child: Text('Successful Passes')),
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: <Widget>[
            GoalTab(),
            YellowCardTab(),
            RedCardTab(),
            TeamGoalTab(),
            GoalSaveTab(),
            SuccessPassesTab()
          ],
        ),
      )),
    );
  }
}

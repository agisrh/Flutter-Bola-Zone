import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';
import 'package:bola_zone/src/screen/development_screen.dart';
import 'package:bola_zone/src/screen/home/home_screen.dart';
import 'package:bola_zone/src/screen/match/match_screen.dart';
import 'package:bola_zone/src/screen/match/next_match_screen.dart';
import 'package:bola_zone/src/screen/standing/standing_screen.dart';
import 'package:bola_zone/src/screen/statistics/statistics_screen.dart';
import 'package:bola_zone/src/screen/team/team_screen.dart';

part 'route_name.dart';

final router = GoRouter(
  //errorBuilder: (context, state) => const DevelopmentScreen(),
  // onException: (_, GoRouterState state, GoRouter router) {
  //   router.go('development', extra: state.uri.toString());
  // },
  // redirect: (context, state) {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   if (auth.currentUser == null) {
  //     return '/login';
  //   } else {
  //     return null;
  //   }
  // },
  // Main Screen (Cannot Back)
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomeScreen(),
      // Sub Screen (Can Back)
      routes: [
        GoRoute(
          path: 'teams:id',
          name: Routes.teams,
          builder: (context, state) => TeamScreen(
            teamId: state.pathParameters['id'].toString(),
          ),
        ),
        GoRoute(
          path: 'matches',
          name: Routes.matches,
          builder: (context, state) => const MatchScreen(),
        ),
        GoRoute(
          path: 'next-match',
          name: Routes.nextMatch,
          builder: (context, state) => const NextMatchScreen(),
        ),
        GoRoute(
          path: 'standings',
          name: Routes.standings,
          builder: (context, state) => const StandingsScreen(),
        ),
        GoRoute(
          path: 'statistics',
          name: Routes.statistics,
          builder: (context, state) => const StatisticsScreen(),
        ),
        GoRoute(
          path: 'development',
          name: 'development',
          builder: (context, state) => const DevelopmentScreen(),
        ),
      ],
    ),
  ],
);

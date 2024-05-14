import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/core/export_helper.dart';
import 'package:bola_zone/src/core/bloc/bloc.dart';
import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:bola_zone/src/core/config/app_config.dart';
import 'src/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context)!;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: config.debugTag,
          theme: AppsTheme.theme,
          routerConfig: router,
        );
      },
    );
  }

  static void initSystemDefault() async {
    await ScreenUtil.ensureScreenSize();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  static Widget runWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TeamBloc>(
          create: (context) => TeamBloc()..add(GetTeams()),
        ),
        BlocProvider<MatchBloc>(
          create: (context) => MatchBloc()..add(GetMatches()),
        ),
        // BlocProvider<NextMatchBloc>(
        //   create: (context) => NextMatchBloc()..add(GetNextMatches()),
        // ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<StandingBloc>(
          create: (context) => StandingBloc()..add(GetStandings()),
        ),
        BlocProvider<TopScorerBloc>(
          create: (context) => TopScorerBloc()..add(GetTopScorer()),
        ),
        BlocProvider<YellowCardBloc>(
          create: (context) => YellowCardBloc()..add(GetYellowCard()),
        ),
        BlocProvider<RedCardBloc>(
          create: (context) => RedCardBloc()..add(GetRedCard()),
        ),
        BlocProvider<GoalSaveBloc>(
          create: (context) => GoalSaveBloc()..add(GetGoalSave()),
        ),
        BlocProvider<SuccessPassesBloc>(
          create: (context) => SuccessPassesBloc()..add(GetSuccessPasses()),
        ),
        BlocProvider<TeamGoalBloc>(
          create: (context) => TeamGoalBloc()..add(GetTeamGoal()),
        ),
        BlocProvider<PlayerBloc>(
          create: (context) => PlayerBloc(),
        ),

        BlocProvider<IndexBloc>(
          create: (context) => IndexBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }

  static defaultErrorHandler(List<AppsError> error,
      {String? buttonText, Function()? buttonOnTap}) {
    // KalogDialogUtils.showGeneralPopup(
    //   image: Icon(
    //     Icons.cancel_outlined,
    //     color: KalogTheme.color.error,
    //     size: 60,
    //   ),
    //   title: error.first.reason,
    //   buttonText: buttonText ?? "Oke",
    //   buttonOnTap: () {
    //     Get.back();
    //     if (buttonOnTap != null) {
    //       buttonOnTap();
    //     }
    //   },
    // );
  }
}

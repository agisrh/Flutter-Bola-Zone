import 'package:flutter/material.dart';
import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:bola_zone/src/screen/home/home_tab.dart';
import 'package:bola_zone/src/screen/home/team_tab.dart';
import 'package:bola_zone/src/screen/error_screen.dart';
import 'package:bola_zone/src/screen/development_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void changePage(int? index) {
    setState(() {
      _currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeTab(),
      const TeamTab(),
      const DevelopmentScreen(),
      const ErrorScreen(),
    ];

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: pages[_currentIndex],
        extendBody: true,
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            menuItem(
              text: 'Home',
              icon: Assets.icons.home.image(
                height: 25,
                color: _currentIndex == 0
                    ? AppsTheme.color.primaryGreen
                    : AppsTheme.color.neutral,
              ),
            ),
            menuItem(
              text: 'Clubs',
              icon: Assets.icons.shieldSecurity.image(
                height: 25,
                color: _currentIndex == 1
                    ? AppsTheme.color.primaryGreen
                    : AppsTheme.color.neutral,
              ),
            ),
            menuItem(
              text: 'News',
              icon: Assets.icons.news.image(
                height: 25,
                color: _currentIndex == 2
                    ? AppsTheme.color.primaryGreen
                    : AppsTheme.color.neutral,
              ),
            ),
            menuItem(
              text: 'Account',
              icon: Assets.icons.account.image(
                height: 25,
                color: _currentIndex == 3
                    ? AppsTheme.color.primaryGreen
                    : AppsTheme.color.neutral,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BottomNavyBarItem menuItem({required String text, required Widget icon}) {
  return BottomNavyBarItem(
    icon: icon,
    title: Text(
      text,
      style: const TextStyle(
        letterSpacing: 0.5,
        fontSize: 12,
      ),
    ),
    activeColor: AppsTheme.color.primaryGreen,
    inactiveColor: AppsTheme.color.neutral.shade500,
    textAlign: TextAlign.center,
  );
}

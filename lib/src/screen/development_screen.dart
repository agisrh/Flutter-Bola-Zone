import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/routes/router.dart';
import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DevelopmentScreen extends StatelessWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.images.warning.image(width: 150),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 3.0),
              child: Text(
                "WARNING !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppsTheme.color.primaryGreen.shade400,
                ),
              ),
            ),
            Text(
              "Sorry, the page you are looking for is currently under development, but we are ready to go !",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppsTheme.color.neutral.shade800),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                context.goNamed('home');
              },
              style: TextButton.styleFrom(
                backgroundColor: AppsTheme.color.primaryGreen,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Back to home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

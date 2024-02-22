import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/routes/router.dart';
import 'package:bola_zone/src/theme/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.images.error.image(width: 150),
            const Padding(
              padding: EdgeInsets.only(bottom: 3.0),
              child: Text(
                "Error ;(",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3b5a99),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ooops, something went wrong. Please \ntry again later...",
                textAlign: TextAlign.center,
              ),
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

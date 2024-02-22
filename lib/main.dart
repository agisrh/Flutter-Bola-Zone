import 'package:bola_zone/src/core/config/environment.dart';
import 'package:bola_zone/src/routes/router.dart';

import 'app.dart';
import 'package:flutter/material.dart';
import 'src/core/config/app_config.dart';

void main() async {
  MyApp.initSystemDefault();

  // Set local data
  // Get.put(LocalData());
  // localData = Get.find();

  runApp(
    AppConfig(
      appName: Env.appName,
      env: Environment.dev,
      debugTag: true,
      flavorName: "dev",
      initialRoute: Routes.home,
      child: MyApp.runWidget(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:gamers_hub/components/splash_screen/splash_screen.dart';
import 'package:gamers_hub/theme/colors.dart';
import 'package:get/get.dart';

import 'components/home.dart';
import 'core/routes.dart';
import 'theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Theme change using Get',
      theme: themeLight,
      darkTheme: themeDark,
      debugShowCheckedModeBanner: false,
      // NOTE: Optional - use themeMode to specify the startup theme
      themeMode: ThemeMode.system,
      initialRoute: Routes.Home,
      getPages: [
        GetPage(
            name: Routes.Home,
            page: () => MyHomePage(key: Key("Homepage")),
            transition: Transition.leftToRight),
        GetPage(
            name: Routes.Splash,
            page: () => SplashScreen(),
            transition: Transition.leftToRight)
      ],
    );
  }
}

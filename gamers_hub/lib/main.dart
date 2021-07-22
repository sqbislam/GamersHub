import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamers_hub/components/auth_screens/register_screen.dart';
import 'package:gamers_hub/components/dashboard/dashboard_screen.dart';
import 'package:gamers_hub/components/game_screens/game_chooser.dart';
import 'package:gamers_hub/components/individual_chat/messages_screen.dart';
import 'package:gamers_hub/components/splash_screen/splash_screen.dart';
import 'package:gamers_hub/controllers/auth_bindings.dart';
import 'package:get/get.dart';

import 'components/auth_screens/login_screen.dart';

import 'core/routes.dart';
import 'theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gamers Hub',
      theme: themeLight,
      darkTheme: themeDark,
      debugShowCheckedModeBanner: false,
      // NOTE: Optional - use themeMode to specify the startup theme
      themeMode: ThemeMode.dark,
      initialRoute: Routes.Splash,
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(
            name: Routes.Splash,
            page: () => SplashScreen(),
            transition: Transition.rightToLeft),
        GetPage(
          name: Routes.Login,
          page: () => LoginScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.Register,
          page: () => RegisterScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.Dashboard,
          page: () => DashboardScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.Message,
          page: () => MessagesScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.GameChooser,
          page: () => GameChooserScreen(),
          transition: Transition.downToUp,
        )
      ],
    );
  }
}

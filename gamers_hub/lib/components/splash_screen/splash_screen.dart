import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamers_hub/core/routes.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Constants.kdefaultPadding * 3), // 10
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: Constants.kdefaultPadding * 10,
              ),
              Text(
                "Gamer's Hub",
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(),
                textScaleFactor: 3,
              ),
              SizedBox(
                height: Constants.kdefaultPadding * 5,
              ),
              SizedBox(
                  child: SvgPicture.asset(
                    'assets/svg/emojione-v1_video-game.svg',
                    semanticsLabel: "game-console",
                  ),
                  height: Constants.kdefaultPadding * 10,
                  width: Constants.kdefaultPadding * 10),
              SizedBox(
                height: Constants.kdefaultPadding * 10,
              ),
              Text(
                "Welcome to the best social media platform for gamers.",
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white70)),
              ),
              SizedBox(
                height: Constants.kdefaultPadding * 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(Routes.Login);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Get Started"), Icon(Icons.chevron_right)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

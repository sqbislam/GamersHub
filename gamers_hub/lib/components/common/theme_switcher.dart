import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSwitcherButton extends StatefulWidget {
  ThemeSwitcherButton({Key? key}) : super(key: key);

  @override
  _ThemeSwitcherButtonState createState() => _ThemeSwitcherButtonState();
}

class _ThemeSwitcherButtonState extends State<ThemeSwitcherButton> {
  ThemeMode selectedTheme = ThemeMode.dark;
  void onThemeChange() {
    setState(() {
      ThemeMode currTheme =
          selectedTheme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      selectedTheme = currTheme;
      Get.changeThemeMode(currTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onThemeChange,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 8)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.wb_sunny,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text("Switch Theme",
              style: GoogleFonts.roboto()
                  .copyWith(fontSize: 12, fontWeight: FontWeight.bold))
        ]));
  }
}

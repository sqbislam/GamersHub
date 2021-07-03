import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Theme'),
          SizedBox(
            height: 5.0,
          ),
          TextButton(
              onPressed: () {
                Get.changeThemeMode(ThemeMode.dark);
              },
              child: Text("Blue")),
          TextButton(
              onPressed: () {
                Get.changeThemeMode(ThemeMode.light);
              },
              child: Text("Black"))
        ],
      ),
    );
  }
}

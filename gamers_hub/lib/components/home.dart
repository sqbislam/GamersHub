import 'package:flutter/material.dart';
import 'package:gamers_hub/theme/themes.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    print('${MediaQuery.of(context).platformBrightness}');
    print('${Theme.of(context).brightness}');
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'System Brightness: ${Get.mediaQuery.platformBrightness.toString()}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'Theme Brightness: ${Get.theme.brightness.toString()}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 24),
            RadioListTile(
              title: Text('system'),
              value: ThemeMode.system,
              groupValue: _themeMode,
              onChanged: (value) {
                setState(() {
                  _themeMode = value as ThemeMode;
                  Get.changeThemeMode(_themeMode); //STEP 3 - change themes
                });
              },
            ),
            RadioListTile(
              title: Text('dark blue'),
              value: ThemeMode.dark,
              groupValue: _themeMode,
              onChanged: (value) {
                setState(() {
                  _themeMode = value as ThemeMode;
                  Get.changeThemeMode(_themeMode);
                });
              },
            ),
            RadioListTile(
              title: Text('dark'),
              value: ThemeMode.light,
              groupValue: _themeMode,
              onChanged: (value) {
                setState(() {
                  _themeMode = value as ThemeMode;
                  Get.changeThemeMode(_themeMode);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/splash');
              },
              child: Text("Click Me"),
            )
          ],
        ),
      ),
    );
  }
}

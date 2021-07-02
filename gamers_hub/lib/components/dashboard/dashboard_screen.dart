import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamers_hub/components/common/bottom_navigation_bar.dart';
import 'package:gamers_hub/components/global_chat/global_chat.dart';
import 'package:gamers_hub/components/individual_chat/individual_chat.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedPage = 0;
  List<bool> _selections = [false, false, false];

  final PageController controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onPageChange = (int page) {
      setState(() {
        selectedPage = page;
      });
    };
    final onBottomNavTap = (int page) {
      setState(() {
        selectedPage = page;
      });
      controller.jumpToPage(page);
      // controller.animateToPage(page,
      //     duration: const Duration(milliseconds: 800),
      //     curve: Curves.decelerate);
    };

    return WillPopScope(
      onWillPop: () async {
        if (selectedPage == 0) {
          Get.dialog(
            AlertDialog(
              title: Text("Are you sure you want to close the app? "),
              content: Text("All unsaved changes will be lost"),
              actions: <Widget>[
                TextButton(
                  child: Text("CANCEL"),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text("CLOSE"),
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                )
              ],
            ),
            barrierDismissible: false,
          );
          return false;
        } else {
          controller.previousPage(
              duration: Duration(milliseconds: 400), curve: Curves.decelerate);
          return false;
        }
      },
      child: Scaffold(
        body: PageView(
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          scrollDirection: Axis.horizontal,
          controller: controller,
          onPageChanged: onPageChange,
          children: <Widget>[
            Center(
              child: GlobalChatScreen(),
            ),
            Center(
              child: Text('Ranked'),
            ),
            Center(
              child: ChatScreen(),
            ),
            Center(
              child: Text('News'),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Theme'),
                  SizedBox(
                    height: 5.0,
                  ),
                  ToggleButtons(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    children: <Widget>[
                      Text("System"),
                      Text("Dark"),
                      Text("Blue"),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selections.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selections[buttonIndex] = true;
                            switch (buttonIndex) {
                              case 0:
                                Get.changeThemeMode(ThemeMode.system);
                                break;
                              case 1:
                                Get.changeThemeMode(ThemeMode.light);
                                break;
                              case 2:
                                Get.changeThemeMode(ThemeMode.dark);
                                break;
                            }
                          } else {
                            _selections[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: _selections,
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          selectedIndex: selectedPage,
          onItemTap: onBottomNavTap,
        ),
      ),
    );
  }
}

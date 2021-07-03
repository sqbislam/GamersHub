import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamers_hub/components/common/bottom_navigation_bar.dart';
import 'package:gamers_hub/components/global_chat/global_chat.dart';
import 'package:gamers_hub/components/individual_chat/individual_chat.dart';
import 'package:gamers_hub/components/profile_screen/profile_main.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        new TabController(initialIndex: selectedPage, length: 5, vsync: this);
    selectedPage = 0;
  }

  final PageController controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: new TabBarView(
            physics: BouncingScrollPhysics(),
            controller: _controller,
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
              Center(child: ProfileMainScreen())
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          controller: _controller,
          selectedIndex: selectedPage,
        ),
      ),
    );
  }
}

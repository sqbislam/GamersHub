import 'package:flutter/material.dart';
import 'package:gamers_hub/components/profile_screen/profile_activity_list.dart';
import 'package:gamers_hub/components/profile_screen/settings_drawer.dart';
import 'package:gamers_hub/core/routes.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMainScreen extends StatelessWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildProfileAppbar(context),
        endDrawer: SettingsDrawer(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Constants.kdefaultPadding * 2,
                horizontal: Constants.kdefaultPadding * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 50,
                        foregroundImage:
                            NetworkImage("https://i.pravatar.cc/750"),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Michael Harlow",
                              style:
                                  GoogleFonts.roboto().copyWith(fontSize: 20)),
                          Text("Dhaka, Bangladesh",
                              style: GoogleFonts.roboto()
                                  .copyWith(color: Colors.grey)),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.GameChooser);
                              },
                              child: Text("Apex Legends",
                                  style: GoogleFonts.roboto()
                                      .copyWith(fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: Constants.kdefaultPadding * 3,
                  thickness: 0.5,
                  color: Colors.white,
                ),
                Expanded(
                  child: ProfileActivityList(),
                )
              ],
            ),
          ),
        ));
  }

  AppBar _buildProfileAppbar(BuildContext context) {
    return AppBar(
      title: Text("#userTag819",
          style: GoogleFonts.comfortaa().copyWith(
              fontSize: Theme.of(context).textTheme.headline6!.fontSize)),
      actions: [
        Builder(builder: (context) {
          return TextButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              child: Icon(Icons.menu));
        })
      ],
    );
  }
}

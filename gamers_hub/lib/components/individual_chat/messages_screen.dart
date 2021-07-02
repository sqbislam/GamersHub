import 'package:flutter/material.dart';
import 'package:gamers_hub/components/individual_chat/individual_chat.dart';
import 'package:gamers_hub/components/individual_chat/messages_body.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MessagesBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GetX<MessageController>(
        init: MessageController(),
        builder: (val) => Row(
          children: [
            BackButton(
              color: Colors.white,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(val.image.value),
            ),
            SizedBox(width: Constants.kdefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${val.selectedUser}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Active 3m ago",
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

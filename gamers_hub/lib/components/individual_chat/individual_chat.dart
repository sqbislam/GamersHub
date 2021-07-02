import 'package:flutter/material.dart';
import 'package:gamers_hub/components/common/filled_outline_btn.dart';
import 'package:gamers_hub/models/single_chat.dart';
import 'package:gamers_hub/theme/constants.dart';

import 'chat_card.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(Constants.kdefaultPadding, 0,
                Constants.kdefaultPadding, Constants.kdefaultPadding),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FillOutlineButton(
                  press: () {},
                  text: "Inbox".toUpperCase(),
                  isFilled: true,
                ),
                FillOutlineButton(
                  press: () {},
                  text: "Group".toUpperCase(),
                  isFilled: false,
                ),
                FillOutlineButton(
                  press: () {},
                  text: "Spam".toUpperCase(),
                  isFilled: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) =>
                  ChatCard(chat: chatsData[index], press: () => {}),
            ),
          ),
        ],
      ),
    );
  }
}

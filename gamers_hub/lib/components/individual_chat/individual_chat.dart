import 'package:flutter/material.dart';
import 'package:gamers_hub/components/common/filled_outline_btn.dart';
import 'package:gamers_hub/components/individual_chat/messages_screen.dart';
import 'package:gamers_hub/core/routes.dart';
import 'package:gamers_hub/models/single_chat.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_card.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class MessageController extends GetxController {
  RxString selectedUser = ''.obs;
  RxString image = ''.obs;

  void setData(chat) {
    selectedUser.value = chat.name;
    image.value = chat.image;
    update();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Chats",
              style: GoogleFonts.comfortaa(),
              textScaleFactor: 1.4,
            ),
            actions: [
              MaterialButton(
                onPressed: () {},
                child: Icon(Icons.search, size: 32),
              )
            ],
          ),
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
                    SizedBox(
                      width: Constants.kdefaultPadding,
                    ),
                    FillOutlineButton(
                      press: () {},
                      text: "Group".toUpperCase(),
                      isFilled: false,
                    ),
                    SizedBox(
                      width: Constants.kdefaultPadding,
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
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ChatCard(
                      chat: chatsData[index],
                      press: () => {
                            Get.toNamed(Routes.Message),
                            controller.setData(chatsData[index])
                          }),
                ),
              ),
            ],
          ),
        ));
  }
}

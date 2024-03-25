import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../app/const/message_type_const.dart';
import '../../../app/theme/style.dart';
import 'package:intl/intl.dart';
import 'dart:io';
//import 'package:agora_uikit/agora_uikit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:swipe_to/swipe_to.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _textMessageController = TextEditingController();
  bool _isDisplaySendButton = false;
  void dispose() {
    _textMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text("Username"),
            Text(
              "online",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
            )
          ],
        ),
        actions: const [
          Icon(Icons.videocam_rounded),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Image.asset(
              "assets/whatsapp_bg_image.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _messageLayout(
                        context: context,
                        message: "Hello",
                        messageType: MessageTypeConst.textMessage,
                        isSeen: true,
                        isShowTick: true,
                        messageBgColor: Color.fromARGB(255, 0, 122, 93),
                        alignment: Alignment.centerRight,
                        // onSwipe: () {},
                        rightPadding: 50),
                    _messageLayout(
                        context: context,
                        message: "ha bhai bol",
                        messageType: MessageTypeConst.textMessage,
                        isSeen: true,
                        isShowTick: false,
                        messageBgColor: Color.fromARGB(255, 41, 50, 48),
                        alignment: Alignment.centerLeft,
                        // onSwipe: () {},
                        rightPadding: 50),
                    _messageLayout(
                        context: context,
                        message: "kya bolu bhai, kuch samajh nahi aa raha",
                        messageType: MessageTypeConst.textMessage,
                        isSeen: false,
                        isShowTick: true,
                        messageBgColor: Color.fromARGB(255, 0, 122, 93),
                        alignment: Alignment.centerRight,
                        // onSwipe: () {},
                        rightPadding: 50),
                    _messageLayout(
                        context: context,
                        message: "toh me kya karu behen ke lode",
                        messageType: MessageTypeConst.textMessage,
                        isSeen: true,
                        isShowTick: true,
                        messageBgColor: Color.fromARGB(255, 42, 50, 48),
                        alignment: Alignment.centerLeft,
                        // onSwipe: () {},

                        rightPadding: 50),
                    _messageLayout(
                        context: context,
                        message: "Walunj Madarchod",
                        messageType: MessageTypeConst.textMessage,
                        isSeen: true,
                        isShowTick: true,
                        messageBgColor: Color.fromARGB(255, 42, 50, 48),
                        alignment: Alignment.centerLeft,
                        // onSwipe: () {},

                        rightPadding: 50),
                    _messageLayout(
                        context: context,
                        message: "ha bhai pata hai na",
                        messageType: MessageTypeConst.textMessage,
                        isSeen: true,
                        isShowTick: true,
                        messageBgColor: Color.fromARGB(255, 20, 138, 108),
                        alignment: Alignment.centerRight,
                        // onSwipe: () {},

                        rightPadding: 50)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: appBarColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textMessageController,
                          onChanged: (value) {
                            setState(() {
                              _isDisplaySendButton = value.isNotEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: InputBorder.none,
                            hintText: "Type a message",
                            prefixIcon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: greyColor,
                            ),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, right: 10),
                              child: Wrap(children: [
                                Icon(
                                  Icons.attach_file,
                                  color: greyColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.camera_alt,
                                  color: greyColor,
                                ),
                                SizedBox(width: 5),
                              ]),
                            ),
                            hintStyle: const TextStyle(color: greyColor),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: tabColor,
                          ),
                          child: Center(
                            child: Icon(
                              _isDisplaySendButton
                                  ? Icons.send_outlined
                                  : Icons.mic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _messageLayout({
  Color? messageBgColor,
  Alignment? alignment,
  GestureDragUpdateCallback? onSwipe, // Update the callback type
  String? message,
  String? messageType,
  bool? isShowTick,
  bool? isSeen,
  VoidCallback? onLongPress,
  double? rightPadding,
  BuildContext? context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: SwipeTo(
      onRightSwipe: onSwipe,
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
          //color: Color.fromARGB(157, 116, 192, 254),
          alignment: alignment,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    //  color: Colors.green,
                    margin: const EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                        left: 5,
                        // right: messageType == MessageTypeConst.textMessage
                        //     ? rightPadding!
                        //     : 5,
                        top: 5,
                        right: 85,
                        bottom: 5),
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context!).size.width * 0.80),
                    decoration: BoxDecoration(
                        color: messageBgColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$message",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                ],
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      DateFormat.jm().format(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 200, 200, 200)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    isShowTick == true
                        ? Icon(
                            isSeen == true ? Icons.done_all : Icons.done,
                            size: 16,
                            color: isSeen == true ? Colors.blue : greyColor,
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

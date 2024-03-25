import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/app/global/widgets/profileWidgets.dart';
import 'package:whatsapp_FBI/features/app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for DateFormat

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, "singleChatPage");
          },
          leading: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: buildProfileWid(imageUrl: 'assets/kunal.png'),
            ),
          ),
          title: const Text('Kunal Patil'),
          subtitle: const Text(
            'Last Message hi',
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          trailing: Text(
            DateFormat.jm().format(DateTime.now()),
            style: const TextStyle(color: greyColor, fontSize: 13),
          ),
        );
      },
    ));
  }
}

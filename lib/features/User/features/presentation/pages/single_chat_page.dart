import 'package:flutter/material.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
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
    );
  }
}

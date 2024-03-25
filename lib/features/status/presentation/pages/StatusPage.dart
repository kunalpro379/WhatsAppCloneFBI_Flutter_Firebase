import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/User/Presentation/pages/user_info_pages.dart';
import 'package:whatsapp_FBI/features/app/global/widgets/profileWidgets.dart';
import 'package:whatsapp_FBI/features/app/theme/style.dart';
import 'package:whatsapp_FBI/features/status/presentation/widgets/StateCircularAvatarStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const SizedBox(width: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text("Status",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        width: 70,
                        height: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: buildProfileWid(),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 4,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: tabColor,
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(width: 2, color: backgroundColor)),
                          child: const Center(
                            child: Icon(Icons.add, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  StatusCircularAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  StatusCircularAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  StatusCircularAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  StatusCircularAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  StatusCircularAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  StatusCircularAvatar()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

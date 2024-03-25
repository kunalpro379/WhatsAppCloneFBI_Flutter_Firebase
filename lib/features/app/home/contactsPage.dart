import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_FBI/features/app/global/widgets/profileWidgets.dart';

import '../theme/style.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Contacts'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
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
                'Hi there, I am using whatsapp_FBI',
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              // trailing: Text(
              //   DateFormat.jm().format(DateTime.now()),
              //   style: const TextStyle(color: greyColor, fontSize: 13),
              // ),
            );
          },
        ));
  }
}

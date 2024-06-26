import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_FBI/Screens/mainCallScreen.dart.dart';
import 'package:whatsapp_FBI/common/extension/custon_theme_extension.dart';
import 'package:whatsapp_FBI/common/widgets/custom_elevated_button.dart';
import 'package:whatsapp_FBI/features/User/auth/widgets/Custom_Icon.dart';
import 'package:whatsapp_FBI/features/User/auth/widgets/custom_text_field.dart';
import 'package:whatsapp_FBI/features/User/auth/widgets/short_h_bar.dart';
import 'package:whatsapp_FBI/features/app/const/app_const.dart';

import '../../../app/global/widgets/profileWidgets.dart';
import '../../../app/home/homepage.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File? _image;
  Future selectImg() async {
    try {
      final pickedFile = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("No image selected");
        }
      });
    } catch (e) {
      print(e);
      toast("s o m e--e r r o r--o c c u r r e d--$e");
    }
  }

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ShortHBar(),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Profile Photo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  CustomIconButton(
                    onTap: () => Navigator.pop(context),
                    icon: Icons.close,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              Divider(
                color: context.theme.greyColor!.withOpacity(2),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  // ImagePickerIcon(
                  //     onTap: () {},
                  //     icon: Icons.camera_alt_rounded,
                  //     text: 'Camera')
                  GestureDetector(
                    onTap: selectImg,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: buildProfileWid(image: _image),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  ImagePickerIcon(
      {required VoidCallback onTap,
      required IconData icon,
      required String text}) {
    return Column(
      children: [
        CustomIconButton(
          onTap: onTap,
          icon: icon,
          iconColor: Colors.green,
          minWidth: 50,
          border: Border.all(color: context.theme.greyColor!.withOpacity(1)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        title: Text(
          'profile Info',
          style: TextStyle(color: context.theme.authAppbartextColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Text(
              'please provide your name and an optional profile photo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.photoIconBgColor,
                ),
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 3, right: 3),
                    child: GestureDetector(
                      onTap: selectImg,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: buildProfileWid(image: _image),
                        ),
                      ),
                    ))),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: MyCustomTextField(
                    hintText: 'Type your name here',
                    textAlign: TextAlign.left,
                    autofocus: true,
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: context.theme.photoIconColor,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                  //title: 'WhatsApp',
                  ),
            ),
          );
        },
        text: 'NEXT',
        buttondWidth: 90,
        textStyle: TextStyle(color: context.theme.greyColor),
      ),
    );
  }
}

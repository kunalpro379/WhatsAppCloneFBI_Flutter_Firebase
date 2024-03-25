//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/User/Presentation/pages/login_page.dart';
import 'package:whatsapp_FBI/features/chat/presentation/pages/chat_page.dart';

import '../../features/User/Presentation/pages/verification_pages.dart';
import '../../features/app/welcome/WelcomePage.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String ChatsPage = "ChatsPage";

  static const String userinfo = 'userinfo';

  // static const String welcome = 'welcome';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );

      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case ChatsPage:
        return MaterialPageRoute(
          builder: (context) => const ChatPage(),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
              //VerificationId: args['verification'],
              //PhoneNumber: args['phone Number'],
              ),
        );

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Page Route Provided'),
                  ),
                ));
    }
  }
}

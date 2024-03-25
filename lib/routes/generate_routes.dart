import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/app/const/appconst.dart';
import 'package:whatsapp_FBI/features/app/welcome/WelcomePage.dart';

import '../features/User/Presentation/pages/user_info_pages.dart';
import '../features/User/Presentation/pages/verification_pages.dart';
import '../features/app/splash/splash_screen.dart';
import '../features/User/Presentation/pages/login_page.dart';
import '../features/chat/presentation/pages/single_chat_page.dart';
// import '../features/chat/features/welcome/pages/user_info_pages.dart';
// import '../features/chat/features/welcome/pages/verification_pages.dart';
import '../features/app/const/appconst.dart';

class OngenrateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      // case PageConst.contactUsersPage:
      //   return MaterialPageBuilder(const ContactPage());
      case PageConst.singleChatPage:
        return MaterialPageBuilder(const SingleChatPage());
      case PageConst.userInfoPage:
        return MaterialPageBuilder(const UserInfoPage());
      case PageConst.verificationPage:
        return MaterialPageBuilder(VerificationPage());
      case PageConst.welcomePage:
        return MaterialPageBuilder(const WelcomePage());
      // case PageConst.loginPage:
      //   return MaterialPageBuilder(const LoginPage());
      // case PageConst.initialProfileSubmitPage:
      //   return MaterialPageBuilder(const InitialProfileSubmitPage());
      // case PageConst.homePage:
      //   return MaterialPageBuilder(const HomePage());
      // case PageConst.callContactsPage:
      //   return MaterialPageBuilder(const CallContactsPage());
      // case PageConst.settingsPage:
      //   return MaterialPageBuilder(const SettingsPage());
      // case PageConst.myStatusPage:
      //   return MaterialPageBuilder(const MyStatusPage());
      // case PageConst.callPage:
      //   return MaterialPageBuilder(const CallPage());
      // case PageConst.editProfilePage:
      //   return MaterialPageBuilder(const EditProfilePage());
      default:
        return null;
    }
  }

  static MaterialPageRoute<dynamic> MaterialPageBuilder(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}

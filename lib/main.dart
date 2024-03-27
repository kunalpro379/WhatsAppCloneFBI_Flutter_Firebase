import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/User/Presentation/pages/login_page.dart';
import 'package:whatsapp_FBI/features/User/Presentation/pages/user_info_pages.dart';
import 'package:whatsapp_FBI/features/User/Presentation/pages/verification_pages.dart';
import 'package:whatsapp_FBI/common/route/routes.dart';
import 'package:whatsapp_FBI/common/theme/dark_theme.dart';
import 'package:whatsapp_FBI/common/theme/light_theme.dart';
import 'package:whatsapp_FBI/features/app/welcome/WelcomePage.dart';
import 'package:whatsapp_FBI/features/chat/presentation/pages/single_chat_page.dart';
import 'package:whatsapp_FBI/features/chat/presentation/pages/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// void main() async {
//   // Ensure Flutter binding is initialized
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Firebase
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   // Run the app
//   runApp(const MyApp());
// }
void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whatsapp_FBI_FBI',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: "/",
      onGenerateRoute: Routes.onGenerateRoute,
      routes: {
        "/": (context) => const WelcomePage(),
        "loginPage": (context) => const LoginPage(),
        "verificationPage": (context) => VerificationPage(),
        "userInfoPage": (context) => const UserInfoPage(),
        "ChatsPage": (context) => ChatPage(),
        "singleChatPage": (context) => SingleChatPage(),
      },
    );
  }
}

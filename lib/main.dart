import 'package:flutter/material.dart';
import 'package:whatsapp_FBI/features/app/splash/splash_screen.dart';
// import 'package:whatsapp_FBI/features/chat/features/presentation/pages/single_chat_page.dart';
import 'package:whatsapp_FBI/common/route/routes.dart';
import 'package:whatsapp_FBI/common/theme/dark_theme.dart';
import 'package:whatsapp_FBI/common/theme/light_theme.dart';
import 'package:whatsapp_FBI/features/app/welcome/WelcomePage.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
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
      home: WelcomePage(), // Assuming SplashScreen is your initial screen
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

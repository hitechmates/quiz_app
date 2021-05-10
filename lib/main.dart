import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

import 'network/cookie_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget  _defaultHome = WelcomeScreen();// WelcomeScreen();
    // Get result of the login function.
    String token = CookieManager.getCookie("token");
    print("token: " + token);
    bool _result = token.isNotEmpty || token != "";
    if (_result) {
      _defaultHome = QuizScreen();
    }

    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: _defaultHome,
    );
  }
}

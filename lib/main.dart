import 'package:difix/pages/main_screen/main_screen.dart';
import 'package:difix/pages/request_screen.dart';
import 'package:difix/pages/signin_screen.dart';
import 'package:difix/pages/sign_select_screen.dart';
import 'package:difix/pages/intro_screen.dart';
import 'package:difix/pages/signup_screen.dart';
import 'package:difix/pages/solving_progress_screen.dart';
import 'package:difix/pages/splash_screen.dart';
import 'package:difix/pages/under_contruction_screen.dart';
import 'package:difix/theme/base_colors.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  "/select": (BuildContext context) => WelcomeScreen(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/signin": (BuildContext context) => SigninScreen(),
  "/signup": (BuildContext context) => SignUpScreen(),
  "/request": (BuildContext context) => RequestScreen(),
  "/processing": (BuildContext context) => ProcessingScreen(),
  "/undercont": (BuildContext context) => UnderContructionScreen(),
  "/main": (BuildContext context) => MainActivityScreen(),
};

void main() => runApp(new MaterialApp(
    theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: blueLightColor,
      ),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
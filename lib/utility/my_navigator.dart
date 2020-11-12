import 'package:flutter/material.dart';

class MyNavigator {
  static void goToSelect(BuildContext context) {
    Navigator.pushNamed(context, "/select");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/signin");
  }

  static void goToSignup(BuildContext context) {
    Navigator.pushNamed(context, "/signup");
  }

  static void goToRequest(BuildContext context) {
    Navigator.pushNamed(context, "/request");
  }

  static void goToProcessing(BuildContext context) {
    Navigator.pushNamed(context, "/processing");
  }

  static void goToMain(BuildContext context) {
    Navigator.pushNamed(context, "/main");
  }

  static void goToUnderContruction(BuildContext context) {
    Navigator.pushNamed(context, "/undercont");
  }
}

import 'package:difix/theme/font_style.dart';
import 'package:difix/utility/base_const.dart';
import 'package:difix/theme/base_image.dart';
import 'package:flutter/material.dart';
import 'package:difix/utility/my_navigator.dart';
import 'package:difix/widgets/background.dart';
import 'package:difix/widgets/rounded_button.dart';
import 'package:difix/theme/base_colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                BaseConst.brand_text,
                style: BaseFont.title,
              ),
              SizedBox(height: size.height * 0.05),
              BaseImage.assetImageSetHeight(
                  BaseImage.welcome,
                  size.height * 0.45
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: BaseConst.login,
                press: () {
                  MyNavigator.goToLogin(context);
                },
              ),
              RoundedButton(
                text: BaseConst.sign_up,
                color: primaryColor,
                textColor: Colors.black,
                press: () {
                  MyNavigator.goToSignup(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

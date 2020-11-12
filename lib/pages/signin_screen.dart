import 'package:difix/theme/base_image.dart';
import 'package:difix/utility/base_const.dart';
import 'package:difix/utility/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:difix/widgets/already_have_an_account_acheck.dart';
import 'package:difix/widgets/rounded_button.dart';
import 'package:difix/widgets/rounded_input_field.dart';
import 'package:difix/widgets/rounded_password_field.dart';
import 'package:difix/widgets/background.dart';

class SigninScreen extends StatelessWidget {
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
                BaseConst.login,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
            BaseImage.assetImageSetHeight(
                BaseImage.login,
                size.height * 0.35
            ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                icon: Icons.person,
                hintText: BaseConst.email,
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: BaseConst.login,
                press: () {
                  MyNavigator.goToMain(context);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
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

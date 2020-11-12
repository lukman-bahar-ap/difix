import 'package:difix/utility/base_const.dart';
import 'package:difix/theme/base_image.dart';
import 'package:flutter/material.dart';
import 'package:difix/widgets/background.dart';
import 'package:difix/widgets/rounded_button.dart';
import 'package:difix/theme/base_colors.dart';

class UnderContructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseImage.assetImageSetHeight(
                  BaseImage.undercontruction,
                  size.height * 0.45
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                BaseConst.sorry,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: BaseConst.back,
                color: activeOrangeColor,
                textColor: Colors.black,
                press: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

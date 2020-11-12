import 'package:difix/theme/base_colors.dart';
import 'package:difix/theme/base_image.dart';
import 'package:difix/theme/font_style.dart';
import 'package:flutter/material.dart';
import 'package:difix/widgets/background.dart';

class ProcessingScreen extends StatelessWidget {
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
                BaseImage.welcome,
                size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                "Tunggulah, Kami segera menyelesaikannya :) ",
                style: TextStyle(
                    fontFamily: BaseFont.montserrat_Reg,
                    fontWeight: FontWeight.bold,
                    color: dark_grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:difix/utility/base_const.dart';
import 'package:difix/utility/my_navigator.dart';
import 'package:difix/theme/font_style.dart';
import 'package:difix/theme/base_image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => MyNavigator.goToIntro(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BaseImage.imageLogo(100, 100),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        BaseConst.name,
                        style: BaseFont.headline,
                      ),
                      Text(
                        BaseConst.description,
                        style: BaseFont.subtitle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: BaseImage.imageFooter,
          ),
        ],

      ),

    );
  }
}

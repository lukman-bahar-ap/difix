import 'package:flutter/material.dart';

class BaseImage {
  BaseImage._();
  static const dir ='assets/images/';

  static const intro1 = dir + 'intro/intro1.png';
  static const intro2 = dir + 'intro/intro2.png';
  static const intro3 = dir + 'intro/intro3.png';
  static const intro4 = dir + 'intro/intro4.png';

  static const welcome = dir + 'welcome.png';
  static const login = dir + 'login.png';
  static const signup = dir + 'signup.png';
  static const no_inbox = dir + 'no_inbox.png';
  static const undercontruction = dir + 'undercontruction.png';

  static const Image imageFooter = Image(
    image: AssetImage(dir + 'footersplashscreen.png'),
    height: 135,
    alignment: Alignment.bottomCenter,
      fit: BoxFit.fitWidth,
  );

  static Image imageLogo(double width, double height) {
   return Image(
      image: AssetImage(dir + 'logo.png'),
      width: width,
      height: height,
    );
  }

  static Image assetImageSetHeight(String url, double height) {
    return Image(
      image: AssetImage(url),
      height: height,
    );
  }

  static Image imageIntro(String url){
    return Image(
      image: AssetImage(url),
      height: 235,
      alignment: Alignment.bottomCenter,
      fit: BoxFit.fitWidth,
    );
  }

  static final List<String> imgSlider = [
    dir + 'slider/slide1.jpg',
    dir + 'slider/slide2.jpg',
    dir + 'slider/slide3.jpg',
    dir + 'slider/slide4.jpg',
    dir + 'slider/slide5.jpg'
  ];

  static Image imageSlider(String url){
    return Image(
      image: AssetImage(url),
      width: 10000,
      fit: BoxFit.cover,
    );
  }

}
import 'package:difix/theme/base_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlideView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  static final List<String> imgSlider = BaseImage.imgSlider;

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: BaseImage.imageSlider(fileImage),
        ),
      );
    }).toList(),
    height: 200,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
  );


  BannerSlideView(
      {Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Column(
                children: <Widget>[
                  autoPlayImage,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:difix/theme/font_style.dart';
import 'package:difix/theme/base_colors.dart';

class AppBarView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final Animation<double> topBarAnimation;
  final double topBarOpacity;
  final ScrollController scrollController;
  final String titleBar;

  AppBarView({
    Key key,
    this.animationController,
    this.animation,
    this.topBarAnimation,
    this.topBarOpacity,
    this.scrollController,
    this.titleBar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  titleBar,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: BaseFont.montserrat_Reg,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: darkerText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}


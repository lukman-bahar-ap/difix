import 'dart:ui';
import 'package:difix/theme/font_style.dart';
import 'package:difix/utility/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:difix/theme/base_colors.dart';
import '../../models/setting_menu_data.dart';

class SettingMenuListView extends StatefulWidget {
  const SettingMenuListView(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _SettingMenuListViewState createState() => _SettingMenuListViewState();
}

class _SettingMenuListViewState extends State<SettingMenuListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<SettingMenuListData> settingMenuList = SettingMenuListData.settingMenu;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                itemCount: settingMenuList.length,
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                  settingMenuList.length > 5 ? 5 : settingMenuList.length;
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval(
                              (1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController.forward();
                  return SettingMenuView(
                    callback: () {},
                    settingMenuData: settingMenuList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}


class SettingMenuView extends StatelessWidget {
  const SettingMenuView(
      {Key key,
        this.settingMenuData,
        this.animationController,
        this.animation,
        this.callback})
      : super(key: key);

  final VoidCallback callback;
  final SettingMenuListData settingMenuData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 0),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  MyNavigator.goToUnderContruction(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              color: white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8, bottom: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              settingMenuData.titleTxt,
                                              textAlign: TextAlign.left,
                                              style: BaseFont.caption,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  settingMenuData.descTxt,
                                                  style: BaseFont.caption_second,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

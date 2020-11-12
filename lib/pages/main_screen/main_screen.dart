import 'package:difix/pages/main_screen/models/tabIcon_data.dart';
import 'package:difix/pages/main_screen/screen/history/history_main_screen.dart';
import 'package:difix/pages/main_screen/screen/inbox_screen.dart';
import 'package:difix/pages/main_screen/screen/setting/setting_main_screen.dart';
import 'package:difix/utility/my_navigator.dart';
import 'package:difix/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'widget/bottom_bar_view.dart';

import 'package:difix/theme/base_colors.dart';
import 'screen/home/home_main_screen.dart';

class MainActivityScreen extends StatefulWidget {
  @override
  _MainActivityScreenState createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = Container(
    color: backgroundColor,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = HomeMainScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Container(
        color: backgroundColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder<bool>(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  children: <Widget>[
                    tabBody,
                    bottomBar(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Future<bool> _onWillPop() async {
    return (await Dialogs.ExitAbortDialog(
      context,'Yakin?','Sudah Mau Keluar Aplikasi ?')
    ) ?? false;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            animationController.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              MyNavigator.goToRequest(context);
            });
          },
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                    HomeMainScreen(animationController: animationController);
                });
              });
            } else if(index == 1 ) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      InboxScreen();
                });
              });
            } else if(index == 2 ) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      HistoryMainScreen(animationController: animationController);
                });
              });

            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      SettingMainScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}

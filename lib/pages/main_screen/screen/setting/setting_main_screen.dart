import 'package:difix/pages/main_screen/models/setting_menu_data.dart';
import 'package:difix/pages/main_screen/widget/appbar_view.dart';
import 'package:difix/theme/base_colors.dart';
import 'package:difix/utility/base_const.dart';
import 'package:difix/widgets/dialogs.dart';
import 'package:difix/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'setting_menu_list_view.dart';

class SettingMainScreen extends StatefulWidget {
  const SettingMainScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;

  @override
  _SettingMainScreenState createState() => _SettingMainScreenState();
}

class _SettingMainScreenState extends State<SettingMainScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<SettingMenuListData> settingMenuList = SettingMenuListData.settingMenu;
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 7;

    for (var i = 0; i < settingMenuList.length; i++) {
      listViews.add(
        SettingMenuView(
          callback: () {},
          settingMenuData: settingMenuList[i],
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval(
                      (1 / count) * i, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
    }
    listViews.add(
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18),
          ),
          RoundedButton(
            text: BaseConst.logout,
            color: Colors.red,
            press: () {
              Dialogs.ExitAbortDialog(
                  context,
                  "Yakin keluar Akun?", "Anda perlu login kembali jika telah keluar akun"
              );
            },
          ),
        ]
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            AppBarView(
              animationController: widget.animationController,
              scrollController: scrollController,
              topBarAnimation: topBarAnimation,
              topBarOpacity: topBarOpacity,
              titleBar: 'Setting',
            ),
          ],
        ),
      ),

    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + 26,
              bottom: MediaQuery.of(context).padding.bottom + 92,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

}

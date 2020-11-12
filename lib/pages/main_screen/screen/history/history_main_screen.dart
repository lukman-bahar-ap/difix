import 'package:difix/pages/main_screen/models/history_list_data.dart';
import 'package:difix/pages/main_screen/screen/history/unit_list_view.dart';
import 'package:difix/pages/main_screen/widget/appbar_view.dart';
import 'package:difix/pages/main_screen/widget/title_view.dart';
import 'package:difix/theme/base_colors.dart';
import 'package:flutter/material.dart';

import 'history_list_view.dart';

class HistoryMainScreen extends StatefulWidget {
  const HistoryMainScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;

  @override
  _HistoryMainScreenState createState() => _HistoryMainScreenState();
}

class _HistoryMainScreenState extends State<HistoryMainScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;
  List<HistoryListData> historyList = HistoryListData.historyList;
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

    listViews.add(
      UnitListView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Riwayat Kunjungan IT',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
            Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        iconTitle: null,
      ),
    );
    //history list
    for (var i = 0; i < historyList.length; i++) {
      listViews.add(
        HistoryView(
          callback: () {},
          historyData: historyList[i],
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
              titleBar: 'Riwayat',
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
              top: AppBar().preferredSize.height + 6,
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

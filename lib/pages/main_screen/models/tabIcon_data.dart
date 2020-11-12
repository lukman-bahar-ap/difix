import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  static const dir_icon = 'assets/images/bottom_nav/';
  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: dir_icon + 'tab1.png',
      selectedImagePath: dir_icon + 'tab1_press.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: dir_icon + 'tab2.png',
      selectedImagePath: dir_icon + 'tab2_press.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: dir_icon + 'tab3.png',
      selectedImagePath: dir_icon + 'tab3_press.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: dir_icon + 'tab4.png',
      selectedImagePath: dir_icon + 'tab4_press.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}

import 'package:flutter/material.dart';

class SettingMenuListData {
  Icon icon;
  String titleTxt;
  String descTxt;

  SettingMenuListData({
    this.icon,
    this.titleTxt = '',
    this.descTxt  = '',
  });

  static List<SettingMenuListData> settingMenu = <SettingMenuListData>[
    SettingMenuListData(
      icon: Icon(Icons.dashboard, size: 40.0),
      titleTxt: 'Ubah Password',
      descTxt: 'Ubah kata sandi',
    ),
    SettingMenuListData(
      icon: Icon(Icons.do_not_disturb, size: 40.0),
      titleTxt: 'Bahasa',
      descTxt: 'Tersedia bahasa inggris dan indonesia',
    ),
    SettingMenuListData(
      icon: Icon(Icons.do_not_disturb, size: 40.0),
      titleTxt: 'Saran',
      descTxt: 'Bantu kami untuk lebih baik',
    ),
    SettingMenuListData(
      icon: Icon(Icons.account_circle, size: 40.0),
      titleTxt: 'Panduan',
      descTxt: 'Panduan penggunaan aplikasi',
    ),
    SettingMenuListData(
      icon: Icon(Icons.invert_colors, size: 40.0),
      titleTxt: 'Kebijakan Privasi',
      descTxt: 'Kebijakan privasi, hak cipta dan lisensi',
    ),
    SettingMenuListData(
      icon: Icon(Icons.invert_colors, size: 40.0),
      titleTxt: 'Versi Aplikasi',
      descTxt: 'diFIX versi 1.0 beta',
    ),
  ];
}
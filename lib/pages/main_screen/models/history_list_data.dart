class HistoryListData {
  HistoryListData({
    this.dateTxt = '',
    this.titleTxt = '',
    this.descTxt = '',
    this.status = 'resolved',
  });

  String dateTxt;
  String titleTxt;
  String descTxt;
  String status;

  static List<HistoryListData> historyList = <HistoryListData>[
    HistoryListData(
      dateTxt: '15 Juli 2019',
      titleTxt: 'Tinta Habis',
      descTxt: 'Printer',
    ),
    HistoryListData(
      dateTxt: '09 Desember 2019',
      titleTxt: 'Kertas Nyangkut / PaperJam',
      descTxt: 'Printer',
    ),
    HistoryListData(
      dateTxt: '27 Desember 2019',
      titleTxt: 'Windows Error',
      descTxt: 'Notebook',
    ),
    HistoryListData(
      dateTxt: '11 Januari 2020',
      titleTxt: 'Aplikasi IDM error',
      descTxt: 'Notebook',
    ),
    HistoryListData(
      dateTxt: '01 Februari 2020',
      titleTxt: 'LCD Mati',
      descTxt: 'Notebook',
    ),
    HistoryListData(
      dateTxt: '23 Maret 2020',
      titleTxt: 'Tombol W Pada Keyboard tidak fungsi',
      descTxt: 'Notebook',
    ),
    HistoryListData(
      dateTxt: '17 Juni 2020',
      titleTxt: 'Pasang CCTV',
      descTxt: 'CCTV',
    ),
    HistoryListData(
      dateTxt: '21 Juli 2020',
      titleTxt: 'Tambah Kamera CCTV',
      descTxt: 'CCTV',
    ),
  ];
}

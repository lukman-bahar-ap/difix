class UnitListData {
  UnitListData({
    this.imagePath = '',
    this.unitCategory = '',
    this.startColor = '',
    this.endColor = '',
    this.brand ='',
    this.unitType ='',
    this.countRequest = 0,
  });

  String imagePath;
  String unitCategory;
  String startColor;
  String endColor;
  String brand;
  String unitType;
  int countRequest;

  static const dir_img = 'assets/images/unit/';
  static List<UnitListData> tabIconsList = <UnitListData>[
    UnitListData(
      imagePath: dir_img + 'notebook.png',
      unitCategory: 'Notebook',
      brand: 'Lenovo 310',
      unitType: 'idea 310',
      startColor: '#FA7D82',
      endColor: '#FFB295',
      countRequest: 4,
    ),
    UnitListData(
      imagePath: dir_img + 'printer.png',
      unitCategory: 'Printer',
      brand: 'Epson',
      unitType: '300 L',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
      countRequest: 3,
    ),
    UnitListData(
      imagePath: dir_img + 'proyektor.png',
      unitCategory: 'Proyektor',
      brand: 'BenQ',
      unitType: 'focus 100',
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    UnitListData(
      imagePath: dir_img + 'cctv.png',
      unitCategory: 'CCTV',
      brand: 'Glenz',
      unitType: 'A709',
      startColor: '#6F72CA',
      endColor: '#1E1466',
      countRequest: 2,
    ),
  ];
}

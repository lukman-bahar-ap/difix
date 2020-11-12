class ArticleListData {
  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;

  ArticleListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = '',
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
  });

  static const dir_img = 'assets/images/article/';
  static List<ArticleListData> articleList = <ArticleListData>[
    ArticleListData(
      imagePath: dir_img + 'article1.jpeg',
      titleTxt: 'Hindari ini dari CPU',
      subTxt: 'Jangan lakukan beberapa hal ini!',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
    ),
    ArticleListData(
      imagePath: dir_img + 'article2.jpeg',
      titleTxt: 'Notebook kamu Mati ?',
      subTxt: 'Kenapa biaya NB matot / mati total itu mahal?',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
    ),
    ArticleListData(
      imagePath: dir_img + 'article3.jpeg',
      titleTxt: 'Beli Baru, tapi bingung pilih mana?',
      subTxt: 'Tips Memilih merk dan tipe Unit',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
    ),
  ];
}

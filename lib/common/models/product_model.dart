class Product {
  int id;
  String title, imgUrl, about, ingredients, nutritionalFacts;
  double price, rating;
  List<dynamic> size;
  Product(
      {required this.id,
      required this.title,
      required this.imgUrl,
      required this.size,
      required this.rating,
      required this.price,
      required this.ingredients,
      required this.about,
      required this.nutritionalFacts});
}

class HomeProductCategoryModel {
  int id;
  String title, imgUrl;
  HomeProductCategoryModel({
    required this.id,
    required this.title,
    required this.imgUrl,
  });
}

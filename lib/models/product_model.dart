class Product {
  // String productCategory;
  String title;
  String imgUrl;
  double price;
  double rating;
  bool isFav;
  List<String> size;
  String about;
  String ingredients;
  String nutritionalFact;
  int? quantity = 1;

  Product({
    // required this.productCategory,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.rating,
    required this.isFav,
    required this.size,
    required this.about,
    required this.ingredients,
    required this.nutritionalFact,
    this.quantity,
  });
}

class ProductCategory {
  String title;
  String imgUrl;

  ProductCategory({required this.title, required this.imgUrl});
}

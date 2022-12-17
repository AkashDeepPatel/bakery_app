import '../../common/controllers/base_controller.dart';
import '../../models/product_model.dart';

class HomeController extends BaseController {
  List<ProductCategory> productCategoryList = [
    // ProductCategory(title: "Cake", imgUrl: "assets/home/cake.jpg"),
    // ProductCategory(title: "Cookies", imgUrl: "assets/home/cookies.jpg"),
    // ProductCategory(title: "Breads", imgUrl: "assets/home/bread.jpg"),
    // ProductCategory(title: "Deserts", imgUrl: "assets/home/dessert.jpg"),
    // ProductCategory(title: "Pizza", imgUrl: "assets/home/pizza.jpg"),
    ProductCategory(title: "Cookies", imgUrl: "assets/home/cookies0.png"),
    ProductCategory(title: "Dessert", imgUrl: "assets/home/dessert0.png"),
    ProductCategory(title: "Muffins", imgUrl: "assets/home/muffins0.png"),
    ProductCategory(title: "Pastries", imgUrl: "assets/home/pastries0.png"),
    ProductCategory(
        title: "Soft Drinks", imgUrl: "assets/home/softdrinks0.png"),
  ];
  List<Product> forYouProducts = [
    Product(
        // productCategory: 'Cake',
        title: "Almond Malai Kulfi",
        imgUrl: "assets/home/almondMalaiKulfi.jpeg",
        price: 600.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Baked Flourless Cake",
        imgUrl: "assets/home/bakedFlourlessCake.jpeg",
        price: 500.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Cheese Pizza",
        imgUrl: "assets/home/cheesePizza.jpeg",
        price: 190.25,
        rating: 2.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF")
  ];

  List<Product> popularProductList = [
    Product(
        // productCategory: 'Cake',
        title: "Chocolate Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 546.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Brown Breads",
        imgUrl: "assets/home/brownBread.jpeg",
        price: 456.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Shortbread Cookies",
        imgUrl: "assets/home/shortBreadCookies.jpeg",
        price: 423.25,
        rating: 2.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    // Product(
    //     // productCategory: 'Cake',
    //     title: "Almond Malai Kulfi",
    //     imgUrl: "assets/home/almonfMalaiKulfi.jpeg",
    //     price: 600.25,
    //     rating: 4.3,
    //     isFav: false,
    //     size: ["Small", "Medium", "Large"],
    //     about: "It is about the product",
    //     ingredients: "ingredients",
    //     nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Baked Flourless Cake",
        imgUrl: "assets/home/bakedFlourlessCake.jpeg",
        price: 500.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Cheese Pizza",
        imgUrl: "assets/home/cheesePizza.jpeg",
        price: 190.25,
        rating: 2.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF")
  ];

  List<Product> cakeList = [
    Product(
        // productCategory: 'Cake',
        title: "Chocolate Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 546.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Sponge Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 456.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Genoise Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 423.25,
        rating: 2.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Buiscuit Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 600.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Baked Flourless Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 500.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF"),
    Product(
        // productCategory: 'Cake',
        title: "Unbaked Flourless Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 190.25,
        rating: 2.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF")
  ];
  List<Product> breadList = [
    Product(
        // productCategory: 'Cake',
        title: "Chocolate Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 546.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF")
  ];
  List<Product> cookiesList = [
    Product(
        // productCategory: 'Cake',
        title: "Chocolate Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 546.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF")
  ];
  List<Product> dessertsList = [
    Product(
        // productCategory: 'Cake',
        title: "Chocolate Cake",
        imgUrl: "assets/home/cake.jpg",
        price: 546.25,
        rating: 4.3,
        isFav: false,
        size: ["Small", "Medium", "Large"],
        about: "It is about the product",
        ingredients: "ingredients",
        nutritionalFact: "NF")
  ];
}

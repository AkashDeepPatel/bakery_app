import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/controllers/base_controller.dart';
import '../../common/models/product_model.dart';

class HomeController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    getHomeCategories();
    getForYouProducts();
    getPopularProducts();
  }

  RxList<HomeProductCategoryModel> homeCategories =
      <HomeProductCategoryModel>[].obs;
  getHomeCategories() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('categories')
          .doc('homeCategories')
          .collection('homeCategories')
          .get();
      for (var item in querySnapshot.docs) {
        homeCategories.add(HomeProductCategoryModel(
          id: item.get('id'),
          title: item.get('title'),
          imgUrl: item.get('img_url'),
        ));
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  RxList<Product> forYouProducts = <Product>[].obs;
  getForYouProducts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc('forYouProducts')
          .collection('forYouProducts')
          .get();
      for (var item in querySnapshot.docs) {
        forYouProducts.add(Product(
          id: item.get('id'),
          title: item.get('title'),
          imgUrl: item.get('img_url'),
          about: item.get('about'),
          price: item.get('price'),
          rating: item.get('rating'),
          isVeg: item.get('isVeg'),
          ingredients: item.get('ingredients'),
          nutritionalFacts: item.get('nutritionalFact'),
          size: item.get('size'),
        ));
      }
      debugPrint("got for you products");
    } catch (e) {
      debugPrint("->error$e");
    }
  }

  RxList<Product> popularProductList = <Product>[].obs;
  getPopularProducts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc('popularProducts')
          .collection('popularProducts')
          .get();
      for (var item in querySnapshot.docs) {
        // debugPrint("--->>>${item.get('title')}");
        popularProductList.add(Product(
          id: item.get('id'),
          title: item.get('title'),
          imgUrl: item.get('img_url'),
          about: item.get('about'),
          price: item.get('price'),
          rating: item.get('rating'),
          isVeg: item.get('isVeg'),
          ingredients: item.get('ingredients'),
          nutritionalFacts: item.get('nutritionalFact'),
          size: item.get('size'),
        ));
      }
      // debugPrint("got for you products");
    } catch (e) {
      debugPrint("->error$e");
    }
  }
}

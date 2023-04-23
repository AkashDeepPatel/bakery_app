import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ctr extends BaseController {
  List<Map> homeCategories = [
    {'id': 1, 'title': "Cookies", 'img_url': "cookies.jpeg"},
    {'id': 2, 'title': "Cake", 'img_url': "cake.jpeg"},
    {'id': 3, 'title': "Desserts", 'img_url': "dessert.jpeg"},
    {'id': 4, 'title': "Muffins", 'img_url': "muffin.jpeg"},
    {'id': 5, 'title': "Pizza", 'img_url': "pizza.jpeg"},
    {'id': 6, 'title': "Pastries", 'img_url': "pastries.jpeg"},
    {'id': 7, 'title': "Soft Drinks", 'img_url': "softDrinks.jpeg"},
    {'id': 8, 'title': "Breads", 'img_url': "bread.jpeg"},
  ];
  addHomeCategoriesToFirebase() {
    try {
      for (var item in homeCategories) {
        FirebaseFirestore.instance
            .collection('categories')
            .doc('homeCategories')
            .collection('homeCategories')
            .doc(item['id'].toString())
            .set({
          'id': item['id'],
          'title': item['title'],
          'img_url': item['img_url'],
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  List<Map> forYouProducts = [
    {
      "id": 6,
      'img_url': 'almondMalaiKulfi.jpeg',
      "title": "Almond Malai Kulfi",
      "price": 600.25,
      "rating": 4.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      'id': 4,
      "title": "Baked Flourless Cake",
      'img_url': 'bakedFlourlessCake.jpeg',
      "price": 500.25,
      "rating": 4.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      'id': 5,
      "title": "Cheese Pizza",
      'img_url': 'cheesePizza.jpeg',
      "price": 190.25,
      "rating": 2.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
  ];
  addForYourProductsToFirebase() {
    try {
      for (var item in forYouProducts) {
        FirebaseFirestore.instance
            .collection('products')
            .doc('forYouProducts')
            .collection('forYouProducts')
            .doc(item['id'].toString())
            .set({
          'id': item['id'],
          'title': item['title'],
          'img_url': item['img_url'],
          'price': item['price'],
          'rating': item['rating'],
          'size': item['size'],
          'about': item['about'],
          'ingredients': item['ingredients'],
          'nutritionalFact': item['nutritionalFact'],
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  List<Map> popularProductList = [
    {
      "id": 1,
      "title": "Chocolate Cake",
      'img_url': 'chocolateCake.jpeg',
      "price": 546.25,
      "rating": 4.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": 2,
      "title": "Brown Breads",
      'img_url': 'brownBread.jpeg',
      "price": 456.25,
      "rating": 4.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": 3,
      "title": "Shortbread Cookies",
      'img_url': 'shortBreadCookies.jpeg',
      "price": 423.25,
      "rating": 2.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": 4,
      "title": "Baked Flourless Cake",
      'img_url': 'bakedFlourlessCake.jpeg',
      "price": 500.25,
      "rating": 4.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": 5,
      "title": "Cheese Pizza",
      'img_url': 'cheesePizza.jpeg',
      "price": 190.25,
      "rating": 2.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    }
  ];

  addPopularProductsToFirebase() {
    try {
      for (var item in popularProductList) {
        FirebaseFirestore.instance
            .collection('products')
            .doc('popularProducts')
            .collection('popularProducts')
            .doc(item['id'].toString())
            .set({
          'id': item['id'],
          'title': item['title'],
          'img_url': item['img_url'],
          'price': item['price'],
          'rating': item['rating'],
          'size': item['size'],
          'about': item['about'],
          'ingredients': item['ingredients'],
          'nutritionalFact': item['nutritionalFact'],
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  List<Map> cookies = [
    {
      "id": "cook1",
      "title": "Chocolate Chips",
      'img_url': 'chocolateCake.jpeg',
      "price": 484.25,
      "rating": 4.3,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": "cook2",
      "title": "Shortbread Cookies",
      'img_url': 'chocolateCake.jpeg',
      "price": 254.25,
      "rating": 3.5,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": "cook3",
      "title": "Peanut Butter",
      'img_url': 'chocolateCake.jpeg',
      "price": 186.25,
      "rating": 3.2,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
    {
      "id": "cook4",
      "title": "Sugar Cookies",
      'img_url': 'chocolateCake.jpeg',
      "price": 654.25,
      "rating": 3.1,
      "size": ["Small", "Medium", "Large"],
      "about": "It is about the product",
      "ingredients": "ingredients",
      "nutritionalFact": "NF"
    },
  ];
  addCookiesToFirebase() {
    try {
      for (var item in cookies) {
        FirebaseFirestore.instance
            .collection('products')
            .doc('cookies')
            .collection('cookies')
            .doc(item['id'].toString())
            .set({
          'id': item['id'],
          'title': item['title'],
          'img_url': item['img_url'],
          'price': item['price'],
          'rating': item['rating'],
          'size': item['size'],
          'about': item['about'],
          'ingredients': item['ingredients'],
          'nutritionalFact': item['nutritionalFact'],
        });
      }
    } catch (e) {
      debugPrint("$e");
    }
  }
}

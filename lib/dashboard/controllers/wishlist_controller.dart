import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/models/product_model.dart';
import '../widgets/list_item_tile_widget.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class WishlistController extends BaseController {
  RxList<Product> wishlistList = <Product>[].obs;

  addToWishlist(Product model) async {
    try {
      await _firestore
          .collection('wishlist')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(_firebaseAuth.currentUser!.uid)
          .doc('${model.id}')
          .set({
        'id': model.id,
        'title': model.title,
        'about': model.about,
        'img_url': model.imgUrl,
        'size': model.size,
        'ingredients': model.ingredients,
        'nutritionalFact': model.nutritionalFacts,
        'price': model.price,
        'rating': model.rating,
      });
    } catch (e) {
      debugPrint("$e");
    }
  }

  deleteFromWishlist(Product model) async {
    try {
      await _firestore
          .collection('wishlist')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(_firebaseAuth.currentUser!.uid)
          .doc('${model.id}')
          .delete();
    } catch (e) {
      debugPrint("$e");
    }
  }

  RxBool isFav = false.obs;

  checkIfLikedOrNot(String productId) async {
    // isFav.value = false;
    DocumentSnapshot ds = await _firestore
        .collection("wishlist")
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(_firebaseAuth.currentUser!.uid)
        .doc(productId)
        .get();
    isFav.value = ds.exists;
  }
}

class WishlistList extends StatelessWidget {
  const WishlistList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('wishlist')
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(_firebaseAuth.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListItemTileWidget(
                model: Product(
                    id: data['id'],
                    title: data['title'],
                    imgUrl: data['img_url'],
                    size: ['size'],
                    rating: data['rating'],
                    price: data['price'],
                    ingredients: data['ingredients'],
                    about: data['about'],
                    nutritionalFacts: data['nutritionalFact']));
          }).toList(),
        );
      },
    );
  }
}

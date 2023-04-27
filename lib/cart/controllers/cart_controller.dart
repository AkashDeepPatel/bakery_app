import 'package:bakery_app/cart/model.dart';
import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  RxInt animatedHeight = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animatedHeight.value = 0;
  }


  RxList<CartProductModel> cartItemList = <CartProductModel>[].obs;

  // getUserCart() async {
  //   var user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .get();
  //     cartItemList.value = documentSnapshot.get('cart');
  //   }
  // }
  //
  // addItemInCart() {
  //   var user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .set({"cart": cartItemList}, SetOptions(merge: true));
  //   }
  // }

  addProductToCart(CartProductModel item){
    cartItemList.add(item);
  }

  removeItemFromCart(CartProductModel item){
    cartItemList.remove(item);
  }

  double getTotalMRP() {
    double sum = 0;
    for (int i = 0; i < cartItemList.length; i++) {
      sum = sum + cartItemList[i].product.price*cartItemList[i].itemQty!.value;
    }
    return sum;
  }

  double getDiscountOnMRP() {
    return getTotalMRP() * 0.17;
  }

  double getGrandTotal() {
    return getTotalMRP()-getDiscountOnMRP().toDouble().round();
  }

  double getDeliveryCharges() {
    return 40;
  }
}

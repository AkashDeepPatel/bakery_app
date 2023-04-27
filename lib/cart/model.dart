import 'package:bakery_app/common/models/product_model.dart';
import 'package:get/get.dart';

class CartProductModel {
  CartProductModel({required this.product, this.itemQty});
  Product product;
  RxInt? itemQty = 1.obs;
}
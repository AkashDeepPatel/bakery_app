import 'package:bakery_app/cart/model.dart';

class OrderModel{
  OrderModel({required this.listOfCartProd, this.deliveredOn, this.totalOrderValue});
  List<CartProductModel> listOfCartProd;
  String? totalOrderValue;
  String? deliveredOn;
}
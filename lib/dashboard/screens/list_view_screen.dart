import 'dart:math';

import 'package:bakery_app/cart/controllers/cart_controller.dart';
import 'package:bakery_app/dashboard/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/home_controller.dart';

class ListViewScreen extends GetView<HomeController> {
  const ListViewScreen({Key? key}) : super(key: key);
  static String routeName = "listViewScreen/";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
        showAppBar: true,
        showSearchBar: true,
        child: ListView.builder(
            itemCount: controller.popularProductList.length,
            itemBuilder: (context, index) {
              return ListItemTile(
                  index: index,
                  title: controller.popularProductList[index].title,
                  imgUrl: controller.popularProductList[index].imgUrl,
                  price: controller.popularProductList[index].price,
                  rating: controller.popularProductList[index].rating);
            }));
  }
}

class ListItemTile extends GetView<CartController> {
  ListItemTile({
    Key? key,
    required this.index,
    required this.title,
    required this.imgUrl,
    required this.price,
    required this.rating,
    // required this.isFav,
  }) : super(key: key);
  int index;
  String title;
  double price;
  double rating;
  String imgUrl;
  // RxBool isFav;

  HomeController homeConrtoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: Row(
          children: [
            SizedBox(
              width: 170,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            imgUrl,
                            height: 150,
                            width: 200,
                            fit: BoxFit.fitWidth,
                          ))),
                  Positioned(
                    top: 11,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(29.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 1.0),
                        child: Text("Recommended",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: AppThemes.white)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 30,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppThemes.primary,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 6.0),
                        child: Row(
                          children: [
                            const Icon(Icons.remove, color: AppThemes.black),
                            const HSpace(10),
                            Text("1",
                                style: Theme.of(context).textTheme.labelLarge),
                            const HSpace(10),
                            const Icon(Icons.add, color: AppThemes.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const VSpace(10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              rating.toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const HSpace(6),
                          const Icon(
                            Icons.star,
                            color: AppThemes.primary,
                          ),
                        ],
                      ),
                      Text(
                        "${Random().nextInt(30)} left",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  const VSpace(10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$ $price",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\$ ${(price * 1.17).round()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint("added");
                          controller.cartItemList
                              .add(homeConrtoller.popularProductList[index]);
                          Get.snackbar("Product Added to Cart", "",
                              backgroundColor: AppThemes.black);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppThemes.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Text(
                              "Add to cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppThemes.background),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

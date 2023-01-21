import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../common/controllers/base_controller.dart';
import '../../common/models/product_model.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../screens/product_detail_screen.dart';

class ListItemTileWidget extends StatelessWidget {
  ListItemTileWidget({
    Key? key,
    required this.model,
  }) : super(key: key);
  Product model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              model: model,
            ));
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
                    child: BaseController.getIcon(model.imgUrl, "name",
                        width: 200, height: 125),
                    // Image.asset(
                    //   imgUrl,
                    //   height: 150,
                    //   width: 200,
                    //   fit: BoxFit.fitWidth,
                    // )
                  )),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.title,
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
                              model.rating.toString(),
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
                            "\$ ${model.price}",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\$ ${(model.price * 1.17).round()}",
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
                          // controller.cartItemList
                          //     .add(homeConrtoller.popularProductList[index]);
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

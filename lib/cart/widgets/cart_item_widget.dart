import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/controllers/base_controller.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../controllers/cart_controller.dart';
import '../model.dart';

class CartItemTile extends GetView<CartController> {
  CartItemTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  CartProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
                        child: BaseController.getIcon(model.product.imgUrl,"name",
                            height: 125, width: 175))),
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
                          InkWell(
                              onTap: (){
                                model.itemQty!.value!=1?
                                model.itemQty!.value=(model.itemQty!.value-1):null;
                              },
                              child: const Icon(Icons.remove, color: AppThemes.black)),
                          const HSpace(10),
                          Obx(()=>Text(model.itemQty!.value.toString(),
                              style: Theme.of(context).textTheme.labelLarge),),
                          const HSpace(10),
                          InkWell(
                              onTap: (){
                                model.itemQty!.value<5?
                                model.itemQty!.value=(model.itemQty!.value+1):null;
                              },
                              child: const Icon(Icons.add, color: AppThemes.black)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        model.product.title,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    InkWell(
                        onTap: (){
                          controller.removeItemFromCart(model);
                        },
                        child: Icon(Icons.delete)),
                  ],
                ),
                const VSpace(40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ ${model.product.price}",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "\$ ${(model.product.price * 1.17).toDouble().round()}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

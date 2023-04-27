import 'package:bakery_app/cart/model.dart';
import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../common/models/product_model.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/home_controller.dart';
import '../controllers/product_details_controller.dart';
import '../controllers/wishlist_controller.dart';

class ProductDetailScreen extends GetView<HomeController> {
  ProductDetailScreen({Key? key, required this.model}) : super(key: key);
  @override

  ProductDetailsController detailsCtr = Get.find();
  CartController cartController = Get.find();
  WishlistController wishlistCtr = Get.find();

  Product model;

  Widget build(BuildContext context) {
    RxString selectedItem = "Small".obs;
    return CommonBaseClass(
      showAppBar: true,
      showBottomWidget: true,
      bottomWidgetBottomPadding: 24.0,
      // bottomWidgetTopPadding: 10.0,
      topPadding: 0.0,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 32),
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        wishlistCtr.wishlistItems.contains(model)
                            ?wishlistCtr.removeItemFromWishlist(model)
                            :wishlistCtr.addItemsToWishlist(model);
                      },
                      child: SvgPicture.asset(
                        wishlistCtr.wishlistItems.contains(model)
                            ?CommonAssets.favouritesFilledIcon: CommonAssets.favouritesIcon,
                        color: Theme.of(context).textTheme.titleMedium!.color,
                        // color: isFav.value == false ? AppThemes.background : null,
                      ),
                    ),
                  )),
              Flexible(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: AppTextButton(
                  text: "Add to Cart",
                  textColor: Theme.of(context).iconTheme.color,
                  onTap: () {
                    // debugPrint("added");
                    cartController.addProductToCart(
CartProductModel(product: model, itemQty: detailsCtr.qty)
                    );
                    // cartController.cartItemList
                    //     .add(model);
                    // cartController.addItemInCart();
                    Get.back();
                    Get.snackbar("Product Added to Cart", "",
                        backgroundColor: AppThemes.black);
Get.find<DashboardController>().changeBottomNavigation(2);                },
                ),
              )),
            ],
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 240,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20)),
                  child: BaseController.getIcon(model.imgUrl, "name",
                      height: 220, width: double.infinity),
                    ),
                  ),
                  Obx(()=>Container(
                    decoration: const BoxDecoration(
                        color: AppThemes.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                              onTap: (){
                                detailsCtr.removeQty();
                              },
                              child: const Icon(Icons.remove, color: AppThemes.black)),
                          const HSpace(10),
                          Text(detailsCtr.qty.value.toString(),
                              style: Theme.of(context).textTheme.labelLarge),
                          const HSpace(10),
                          InkWell(
                            onTap: (){
                              detailsCtr.addQty();
                            },
                            child: const Icon(Icons.add, color: AppThemes.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),)
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(model.title,
                              style: Theme.of(context).textTheme.headlineSmall),
                          Text("\$${model.price}",
                              style: Theme.of(context).textTheme.headlineSmall)
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${model.rating}",
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
                          // const HSpace(40),
                          // Text(
                          //   "33 left",
                          //   style: Theme.of(context).textTheme.bodySmall,
                          // )
                        ],
                      ),
                      const VSpace(28),
                      Text("Choose Size",
                          style: Theme.of(context).textTheme.headlineSmall),
                      const VSpace(16),
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: AppThemes.subtleLight),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0))),
                          child: DropdownButtonHideUnderline(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DropdownButton<String>(
                                icon: SvgPicture.asset(
                                  CommonAssets.downArrowIcon,
                                ),
                                isExpanded: true,
                                itemHeight: 50,
                                items: model.size
                                    .map((e) => DropdownMenuItem<String>(
                                        value: e, child: Text(e)))
                                    .toList(),
                                value: selectedItem.value,
                                onChanged: (w) {
                                  selectedItem(w);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const VSpace(28),
                      Text("Description",
                          style: Theme.of(context).textTheme.headlineSmall),
                      ExpansionTile(
                        // iconColor: AppThemes.black,
                        // textColor: AppThemes.black,
                        // collapsedTextColor: AppThemes.black,
                        // collapsedIconColor: AppThemes.black,
                        title: Text('About'),
                        expandedAlignment: Alignment.centerLeft,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                  model.about),
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        // iconColor: AppThemes.black,
                        // textColor: AppThemes.black,
                        // collapsedTextColor: AppThemes.black,
                        // collapsedIconColor: AppThemes.black,
                        title: Text('Ingredient'),
                        expandedAlignment: Alignment.centerLeft,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text(
                                model.ingredients),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        // iconColor: AppThemes.black,
                        // textColor: AppThemes.black,
                        // collapsedTextColor: AppThemes.black,
                        // collapsedIconColor: AppThemes.black,
                        title: Text('Nutritional Facts'),
                        expandedAlignment: Alignment.centerLeft,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text(
                                model.nutritionalFacts),
                          ),
                        ],
                      ),
                      // Text("Ratings",
                      //     style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

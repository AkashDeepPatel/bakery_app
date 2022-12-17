import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_card.dart';
import '../../orders/screens/payment_method_screen.dart';
import '../controllers/home_controller.dart';

class ProductDetailScreen extends GetView<HomeController> {
  ProductDetailScreen({Key? key}) : super(key: key);
  @override
  int index = Get.arguments[0];
  RxBool isFav = false.obs;
  CartController cartController = Get.find();
  Widget build(BuildContext context) {
    RxString selectedItem = "Small".obs;
    return CommonBaseClass(
      showAppBar: true,
      showBottomWidget: true,
      bottomWidgetBottomPadding: 20.0,
      bottomWidgetTopPadding: 10.0,
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
                        isFav(!isFav.value);
                      },
                      child: SvgPicture.asset(
                        isFav.value == false
                            ? CommonAssets.favouritesIcon
                            : CommonAssets.favouritesFilledIcon,
                        // color: isFav.value == false ? AppThemes.background : null,
                      ),
                    ),
                  )),
              Flexible(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: AppTextButton(
                  text: "Add to Cart",
                  onTap: () {
                    debugPrint("added");
                    cartController.cartItemList
                        .add(controller.popularProductList[index]);
                    Get.snackbar("Product Added to Cart", "",
                        backgroundColor: AppThemes.black);
                  },
                ),
              )),
            ],
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Stack(
              children: [
                Positioned(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                    child: Image.asset(
                      controller.popularProductList[index].imgUrl,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 220,
                    ),
                  ),
                )),
                Positioned(
                  bottom: 0,
                  left: 140,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppThemes.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                          Text(controller.popularProductList[index].title,
                              style: Theme.of(context).textTheme.headlineSmall),
                          Text(
                              "\$${controller.popularProductList[index].price}",
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
                                  "${controller.popularProductList[index].rating}",
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
                          const HSpace(40),
                          Text(
                            "33 left",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
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
                                items: controller.popularProductList[index].size
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
                      const ExpansionTile(
                        iconColor: AppThemes.black,
                        textColor: AppThemes.black,
                        collapsedTextColor: AppThemes.black,
                        collapsedIconColor: AppThemes.black,
                        title: Text('About'),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc maecenas tempor aliquam nunc amet morbi vitae.'),
                            ),
                          ),
                        ],
                      ),
                      const ExpansionTile(
                        iconColor: AppThemes.black,
                        textColor: AppThemes.black,
                        collapsedTextColor: AppThemes.black,
                        collapsedIconColor: AppThemes.black,
                        title: Text('Ingredient'),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc maecenas tempor aliquam nunc amet morbi vitae.'),
                          ),
                        ],
                      ),
                      const ExpansionTile(
                        iconColor: AppThemes.black,
                        textColor: AppThemes.black,
                        collapsedTextColor: AppThemes.black,
                        collapsedIconColor: AppThemes.black,
                        title: Text('Nutritional Facts'),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc maecenas tempor aliquam nunc amet morbi vitae.'),
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

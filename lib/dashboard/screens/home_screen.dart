import 'package:bakery_app/common/controllers/base_controller.dart';
import 'package:bakery_app/dashboard/controllers/dashboard_controller.dart';
import 'package:bakery_app/dashboard/screens/list_view_screen.dart';
import 'package:bakery_app/dashboard/screens/product_detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/models/product_model.dart';
import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/home_controller.dart';
import '../controllers/wishlist_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final DashboardController _dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      showSearchBar: true,
      child: ListView(
        children: [
          const VSpace(20), 
          // Obx(
          //   () => SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         for (int i = 0; i < controller.homeCategories.length; i++)
          //           CategoriesIcon(
          //               title: controller.homeCategories[i].title,
          //               imgUrl: controller.homeCategories[i].imgUrl),
          //       ],
          //     ),
          //   ),
          // ),
          // const VSpace(24),
          // Image.network(FirebaseStorageService().getImage("common/logo.svg")),
          CarouselSlider(
            items: _dashboardController.carouselSliderItems,
            options: CarouselOptions(
                // height: 400,
                aspectRatio: 16 / 6,
                // viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  _dashboardController.currentSliderIndex.value = index;
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    "| For you",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0;
                            i < controller.forYouProducts.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: DashboardItemTile(
                              model: controller.forYouProducts[i],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "| Popular",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const HSpace(5),
                          SvgPicture.asset(CommonAssets.downArrowIcon)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => ListViewScreen(
                                listModel: controller.popularProductList,
                              ),
                            );
                          },
                          child: Text(
                            "View all",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0;
                            i < controller.popularProductList.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: DashboardItemTile(
                                model: controller.popularProductList[i]),
                          ),
                      ],
                    ),
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

class DashboardItemTile extends GetView<WishlistController> {
  DashboardItemTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  Product model;
  // RxBool isFav = controller.isFav;
  @override
  Widget build(BuildContext context) {
    // controller.checkIfLikedOrNot(model.id.toString());
    // debugPrint("<>${controller.wishlistList[0].toString()}");
    // // debugPrint("<>${controller.wishlistList.contains(model)}");
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(model: model));
      },
      child: Container(
        decoration: const BoxDecoration(
            color: AppThemes.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                BaseController.getIcon(model.imgUrl, 'name'),
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppThemes.black,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        model.price.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: AppThemes.background),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 8,
                //   right: 8,
                //   child: controller.obx((state) => Obx(()=>InkWell(
                //     onTap: () {
                //       controller.addToWishlist(model);
                //       // controller
                //       //     .isFav(!controller.isFav.value);
                //       // !controller.checkIfLikedOrNot("${model.id}")
                //       //     ? controller.addToWishlist(model)
                //       //     : controller.deleteFromWishlist(model);
                //     },
                //     child: Container(
                //         decoration: const BoxDecoration(
                //             color: AppThemes.black,
                //             borderRadius:
                //             BorderRadius.all(Radius.circular(8.0))),
                //         child: Padding(
                //             padding: const EdgeInsets.all(7.0),
                //             child: SvgPicture.asset(
                //               // !controller.wishlistList.contains(model)
                //               controller.isFav.value
                //                   ?CommonAssets.favouritesFilledIcon: CommonAssets.favouritesIcon,
                //               // color: controller.isFav.value == false
                //               //     ? Colors.transparent
                //               //     : null,
                //             ))
                //     ),
                //   )),onLoading: Text("Loading"), onEmpty: Text("error")),
                // )
              ],
            ),
            const VSpace(8),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                model.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const VSpace(2),
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
            const VSpace(8),
          ],
        ),
      ),
    );
  }
}

class CategoriesIcon extends StatelessWidget {
  CategoriesIcon({
    Key? key,
    required this.title,
    required this.imgUrl,
  }) : super(key: key);
  String title;
  String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              child: ClipOval(child: BaseController.getIcon(imgUrl, 'name')),
            ),
            const VSpace(8),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bakery_app/common/utils/firebase_storage_service.dart';
import 'package:bakery_app/dashboard/controllers/dashboard_controller.dart';
import 'package:bakery_app/dashboard/screens/list_view_screen.dart';
import 'package:bakery_app/dashboard/screens/product_detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/home_controller.dart';
import '../utils/dashboard_assets.dart';

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < controller.productCategoryList.length; i++)
                  CategoriesIcon(
                      title: controller.productCategoryList[i].title,
                      imgUrl: controller.productCategoryList[i].imgUrl),
              ],
            ),
          ),
          const VSpace(24),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < controller.forYouProducts.length; i++)
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: DashboardItemTile(
                            index: i,
                            title: controller.forYouProducts[i].title,
                            imgUrl: controller.forYouProducts[i].imgUrl,
                            price: controller.forYouProducts[i].price,
                            rating: controller.forYouProducts[i].rating,
                            isFav: controller.forYouProducts[i].isFav.obs,
                          ),
                        ),
                    ],
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
                            Get.to(() => const ListViewScreen());
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0;
                          i < controller.popularProductList.length;
                          i++)
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: DashboardItemTile(
                            index: i,
                            title: controller.popularProductList[i].title,
                            imgUrl: controller.popularProductList[i].imgUrl,
                            price: controller.popularProductList[i].price,
                            rating: controller.popularProductList[i].rating,
                            isFav: controller.popularProductList[i].isFav.obs,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashboardItemTile extends StatelessWidget {
  DashboardItemTile({
    Key? key,
    required this.index,
    required this.title,
    required this.price,
    required this.rating,
    required this.isFav,
    required this.imgUrl,
  }) : super(key: key);
  int index;
  String title;
  String imgUrl;
  double price;
  double rating;
  RxBool isFav;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(), arguments: [index]);
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
                Image.asset(
                  imgUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
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
                        price.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: AppThemes.background),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        isFav(!isFav.value);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppThemes.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset(
                              isFav.value == false
                                  ? CommonAssets.favouritesIcon
                                  : CommonAssets.favouritesFilledIcon,
                              color: isFav.value == false
                                  ? AppThemes.background
                                  : null,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const VSpace(8),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
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
              child: ClipOval(
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.fill,
                  height: 72,
                ),
              ),
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

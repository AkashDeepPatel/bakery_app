import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/orders_controller.dart';

class OrdersScreen extends GetView<OrdersController> {
  OrdersScreen({Key? key}) : super(key: key);

  final CartController cartCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint(controller.currentOrder.toString());
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      // showBottomWidget: true,
      // bottomWidget: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      //   child: AppTextButton(
      //     text: "Tracking Map",
      //     color: AppThemes.black,
      //     onTap: () {
      //     },
      //   ),
      // ),
      child: DefaultTabController(
        length: controller.tabs.length,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  TabBar(tabs: [
                    // Localization.propertyListView.tr,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        controller.tabs[0],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        controller.tabs[1],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ])
                ]),
              ),
            ];
          },
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Obx(()=>controller.currentOrder.isNotEmpty?ListView.separated(
                  itemCount: controller.currentOrder.length,
                  separatorBuilder: (context, index){
                    return SizedBox(height: 5);
                  },
                  itemBuilder: (context, index){
                    return ExpansionTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              children: List.generate(controller.currentOrder[index].listOfCartProd.length, (index1) => Text("${controller.currentOrder[index].listOfCartProd[index1].product.title} | ")),
                            ),
                          ),
                        ),
                      ),
                    );
                  }):Center(
                child: Text("Nothing to show.")
              )),
              Obx(()=>controller.orderHistory.isNotEmpty?ListView.separated(
                  itemCount: controller.orderHistory.length,
                  separatorBuilder: (context, index){
                    return SizedBox(height: 5);
                  },
                  itemBuilder: (context, index){
                    return ExpansionTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: List.generate(controller.orderHistory[index].listOfCartProd.length, (index1) => Text(" | ${controller.orderHistory[index].listOfCartProd[index1].product.title}")),
                                ),
                                SizedBox(height: 4,),
                                Text("Total Order Value: ${controller.orderHistory[index].totalOrderValue}"),
                                SizedBox(height: 4,),
                                Text("Total Order Value: ${controller.orderHistory[index].deliveredOn}")
                              ],
                            ),
                          ),
                        ),
                      ),
                      children: [
                        OrderStatusWidget()
                      ],
                    );
                  }):Center(
    child: Text("Nothing to show."),
              )),
            ],
          ),
        ),
      )
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const VSpace(40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            "Estimated Delivery",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const VSpace(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            "1 Sep, 2022 | 09:00PM",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppThemes.subtleDark),
          ),
        ),
        const VSpace(48),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSpace(24),
            Column(
              children: [
                SvgPicture.asset(CommonAssets.tickIcon),
                Container(
                  height: 100,
                  width: 2,
                  color: Colors.green,
                ),
                SvgPicture.asset(CommonAssets.tickIcon),
                Container(
                  height: 50,
                  width: 2,
                  color: AppThemes.subtleLight,
                ),
                SvgPicture.asset(CommonAssets.untickedIcon),
                Container(
                  height: 50,
                  width: 2,
                  color: AppThemes.subtleLight,
                ),
                SvgPicture.asset(CommonAssets.untickedIcon),
              ],
            ),
            const HSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VSpace(7),
                Text(
                  "Order Placed",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const VSpace(115),
                Text(
                  "Order Preparing",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const VSpace(57.5),
                Text(
                  "On the Way",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const VSpace(50),
                Text(
                  "Delivered!",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

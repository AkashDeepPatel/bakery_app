import 'package:bakery_app/dashboard/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);
  static String routeName = "listViewScreen/";

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      showSearchBar: true,
      child: ListView(
        children: const [
          ListItemTile(),
          ListItemTile(),
          ListItemTile(),
          ListItemTile(),
          ListItemTile(),
          ListItemTile(),

          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   child: ExpansionTile(
          //     title: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         for (int index = 0; index < 4; index++)
          //           Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(color: Colors.black)),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 8.0, vertical: 10),
          //               child: Text(
          //                 _dashboardController.itemsCategory[index],
          //                 style: Theme.of(context).textTheme.labelSmall,
          //               ),
          //             ),
          //           ),
          //       ],
          //     ),
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           for (int index = 4;
          //               index < _dashboardController.itemsCategory.length;
          //               index++)
          //             Container(
          //               decoration: BoxDecoration(
          //                   border: Border.all(color: Colors.black)),
          //               child: Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                     horizontal: 8.0, vertical: 10),
          //                 child:
          //                     Text(_dashboardController.itemsCategory[index]),
          //               ),
          //             ),
          //           const HSpace(20),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // const Divider(),
        ],
      ),
    );
  }
}

class ListItemTile extends StatelessWidget {
  const ListItemTile({
    Key? key,
  }) : super(key: key);

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
                          child: Image.asset(CommonAssets.bread))),
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
                    "Dukes - Waffy Wafers - pineapp",
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
                              "4.2",
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
                        "33 left",
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
                            "\$ 400.00",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "\$ 450.00",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Container(
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

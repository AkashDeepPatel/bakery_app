import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/styles/app_themes.dart';
import '../controllers/menu_controller.dart';
import '../widgets/menu_tile_item.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  final ItemMenuController _menuController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
        showAppBar: true,
        showlocation: true,
        showSearchBar: true,
        child: Obx(
          () => Row(
            children: [
              Expanded(
                child: Container(
                    color: AppThemes.normal,
                    child: ListView.builder(
                        itemCount: _menuController.menuItems.length,
                        itemBuilder: (context, index) {
                          return MenuItemTile(
                            title: _menuController.menuItems[index],
                            textColor:
                                _menuController.selectedMenuItem.value == index
                                    ? AppThemes.black
                                    : AppThemes.white,
                            onTap: () {
                              _menuController.selectedMenuItem.value = index;
                            },
                          );
                        })),
              ),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: _menuController.menuItemsMap.values
              //           .toList()[_menuController.selectedMenuItem.value]
              //           .length,
              //       itemBuilder: (context, index) {
              //         return MenuItemTile(
              //             title: _menuController.menuItemsMap.values.toList()[
              //                 _menuController.selectedMenuItem.value][index],
              //             textColor: AppThemes.black);
              //       }),
              // ),
            ],
          ),
        ));
  }
}

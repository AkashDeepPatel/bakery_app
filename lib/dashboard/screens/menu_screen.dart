import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/common/widgets/app_text_field.dart';
import 'package:bakery_app/dashboard/screens/schedule_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../utils/dashboard_assets.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  List menuListItem = [
    "Breads",
    "Cakes",
    "Cookies",
    "Deserts",
    "Pizza",
    "Muffins",
  ];
  List breadTypesList = [
    "Brown Breads",
    "Multi-Grain Breads",
    "Corn Breads",
    "Quick Breads",
    "Yeast Breads",
    "Brioche",
    "Challah",
    "Focaccia",
    "Soft Rolls",
    "Flatbreads",
    "Soda Breads",
    "Honey and Oat Breads",
    "Walnut Breads",
  ];
  @override
  Widget build(BuildContext context) {
    RxInt _animatedHeight = 0.obs;
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      showSearchBar: true,
      child: Row(
        children: [
          Expanded(
            child: Container(
                color: AppThemes.normal,
                child: ListView.builder(
                    itemCount: menuListItem.length,
                    itemBuilder: (context, index) {
                      return MenuItemTile(
                        title: menuListItem[index],
                        textColor: AppThemes.white,
                      );
                    })),
          ),
          Expanded(
            child: Container(
                child: ListView.builder(
                    itemCount: breadTypesList.length,
                    itemBuilder: (context, index) {
                      return MenuItemTile(
                          title: breadTypesList[index],
                          textColor: AppThemes.black);
                    })),
          ),
        ],
      ),
    );
  }
}

class MenuItemTile extends StatelessWidget {
  MenuItemTile({
    Key? key,
    required this.title,
    required this.textColor,
  }) : super(key: key);
  String title;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  AppCard({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: child,
          ),
        ));
  }
}

class ProfileItemTile extends StatelessWidget {
  ProfileItemTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        HSpace(24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}

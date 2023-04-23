import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';

class MenuItemTile extends StatelessWidget {
  MenuItemTile({
    Key? key,
    required this.title,
    required this.textColor,
    this.onTap,
  }) : super(key: key);
  String title;
  Color textColor;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Container(
          color:
              textColor == AppThemes.black ? AppThemes.white : AppThemes.normal,
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
      ),
    );
  }
}

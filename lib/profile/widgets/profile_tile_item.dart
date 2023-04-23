import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';

class ProfileItemTile extends StatelessWidget {
  ProfileItemTile({
    Key? key,
    required this.icon,
    required this.title,
    this.showSwitch = false,
    required this.onTap,
    this.switchAction,
    this.switchValue = false,
  }) : super(key: key);
  String icon;
  String title;
  bool showSwitch;
  Function() onTap;
  final bool switchValue;
  final Function(dynamic)? switchAction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const HSpace(24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Spacer(),
          showSwitch
              ?Switch(
              value: switchValue, onChanged: switchAction)
              :SizedBox(),
        ],
      ),
    );
  }
}

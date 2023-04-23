import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../profile/screens/your_address_screen.dart';
import '../utils/common_assets.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(CommonAssets.downArrowIcon),
            Expanded(
              child: YourAddressScreen(
                showAppBar: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:bakery_app/dashboard/screens/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_text_field.dart';

class ScheduleOrderScreen extends StatelessWidget {
  const ScheduleOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      pageTitle: "Cart",
      showBottomWidget: true,
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: AppTextButton(
          text: "Continue",
          color: AppThemes.black,
          onTap: () {
            Get.to(() => PaymentMethodScreen());
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text("| Schedule Your Order! ",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Text("Deliver to", style: Theme.of(context).textTheme.labelLarge),
            const VSpace(16),
            AppTextField(
              hintText: "Location",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  CommonAssets.editIcon,
                ),
              ),
            ),
            const VSpace(32),
            AppTextField(
              hintText: "Phone Number",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  CommonAssets.editIcon,
                ),
              ),
            ),
            const VSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Preferred Delivery Time",
                    style: Theme.of(context).textTheme.labelLarge),
                SvgPicture.asset(
                  CommonAssets.downArrowIcon,
                ),
              ],
            ),
            const VSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: AppThemes.primarySubtle3,
                      child: Center(
                          child: Text(
                        "Now",
                        style: Theme.of(context).textTheme.labelMedium,
                      )),
                    ),
                  ),
                ),
                HSpace(20),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: AppThemes.primarySubtle3,
                      child: Center(
                          child: Text(
                        "Choose Date and Time",
                        style: Theme.of(context).textTheme.labelMedium,
                      )),
                    ),
                  ),
                ),
              ],
            ),
            VSpace(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Type",
                    style: Theme.of(context).textTheme.labelLarge),
                SvgPicture.asset(
                  CommonAssets.downArrowIcon,
                ),
              ],
            ),
            const VSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: AppThemes.primarySubtle3,
                      child: Center(
                          child: Text(
                        "Deliver Me",
                        style: Theme.of(context).textTheme.labelMedium,
                      )),
                    ),
                  ),
                ),
                HSpace(20),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      color: AppThemes.primarySubtle3,
                      child: Center(
                          child: Text(
                        "I Will Pick Up",
                        style: Theme.of(context).textTheme.labelMedium,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

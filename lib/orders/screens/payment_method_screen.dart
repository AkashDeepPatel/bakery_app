import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../../common/widgets/app_text_field.dart';
import 'order_summary_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

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
            Get.to(() => const OrderSummaryScreen());
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text("| Choose Payment Method",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            CardPaymentTile(
              title: "Credit/ Debit Card",
            ),
            const VSpace(28),
            UPIPaymentTile(
              // Net Banking
              title: "UPI",
            ),
            const VSpace(28),
            CashPaymentTile(
              title: "Cash",
            ),
            const VSpace(28),
            RazorpayPaymentTile(
              title: "RazorPay Payment",
            ),
          ],
        ),
      ),
    );
  }
}

class CardPaymentTile extends StatelessWidget {
  CardPaymentTile({Key? key, required this.title}) : super(key: key);
  String title;
  RxBool isExpanded = false.obs;
  RxDouble height = 56.0.obs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isExpanded(!isExpanded.value);
      },
      child: Obx(() => Container(
          // height: isExpanded.value == true ? 100.0 : 56.0,
          decoration: BoxDecoration(
            border: Border.all(color: AppThemes.subtleLight, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          // color: AppThemes.primarySubtle3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                    ),
                    SvgPicture.asset(CommonAssets.downArrowIcon)
                  ],
                ),
                isExpanded == true
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VSpace(16.0),
                          AppTextField(
                            title: "Card Number",
                          ),
                          VSpace(8.0),
                          AppTextField(
                            title: "Expiry Date",
                          ),
                          VSpace(8.0),
                          AppTextField(
                            title: "CVV",
                          ),
                          VSpace(8.0),
                          AppTextField(
                            title: "Name on Card",
                          )
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ))),
    );
  }
}

class UPIPaymentTile extends StatelessWidget {
  UPIPaymentTile({Key? key, required this.title}) : super(key: key);
  String title;
  RxBool isExpanded = false.obs;
  RxDouble height = 56.0.obs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isExpanded(!isExpanded.value);
      },
      child: Obx(() => Container(
          // height: isExpanded.value == true ? 100.0 : 56.0,
          decoration: BoxDecoration(
            border: Border.all(color: AppThemes.subtleLight, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          // color: AppThemes.primarySubtle3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                    ),
                    SvgPicture.asset(CommonAssets.downArrowIcon)
                  ],
                ),
                isExpanded == true
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VSpace(16.0),
                          AppTextField(
                            title: "UPI ID",
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ))),
    );
  }
}

class CashPaymentTile extends StatelessWidget {
  CashPaymentTile({Key? key, required this.title}) : super(key: key);
  String title;
  RxBool isExpanded = false.obs;
  RxDouble height = 56.0.obs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isExpanded(!isExpanded.value);
      },
      child: Obx(() => Container(
          // height: isExpanded.value == true ? 100.0 : 56.0,
          decoration: BoxDecoration(
            border: Border.all(color: AppThemes.subtleLight, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          // color: AppThemes.primarySubtle3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                    ),
                    SvgPicture.asset(CommonAssets.downArrowIcon)
                  ],
                ),
                isExpanded == true
                    ? Column(
                        children: [
                          VSpace(16),
                          Text(
                            "Grand Total: 100.0",
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ))),
    );
  }
}

class RazorpayPaymentTile extends StatelessWidget {
  RazorpayPaymentTile({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          try {
            await launchUrl(
                Uri.parse('https://pages.razorpay.com/pl_JuXRuPrvw6ttaf/view'));
          } catch (e) {
            debugPrint("----${e}");
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: const Color.fromRGBO(34, 48, 60, 0.6),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      title: Center(
                        child: Text(
                          'Unknown Error Occured',
                          style: TextStyle(color: Colors.red, fontSize: 18.0),
                        ),
                      ),
                      content: Center(
                        child: Text(
                          'Make Sure your Internet Connected Properly',
                          style: TextStyle(color: Colors.amber, fontSize: 18.0),
                        ),
                      ),
                    ));
          }
        },
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppThemes.subtleLight, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            // color: AppThemes.primarySubtle3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                      ),
                      SvgPicture.asset(CommonAssets.rightArrowIcon)
                    ],
                  ),
                ],
              ),
            )));
  }
}

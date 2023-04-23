import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

class CommonAssets {
  static String circularPlaceholder = "assets/placeholders/circularImage.svg";
  static const String squarePlaceholder = "assets/placeholders/squareImage.svg";
  static String logo = "assets/common/icons/logo.svg";
  static const String notificationIcon = "assets/common/icons/notification.svg";
  static const String favouritesIcon = "assets/common/icons/heart.svg";
  static const String favouritesFilledIcon =
      "assets/common/icons/heart_filled.svg";
  static const String locationPinIcon = "assets/common/icons/location_pin.svg";
  static const String locationPin2Icon =
      "assets/common/icons/location_pin2.svg";
  static const String downArrowIcon = "assets/common/icons/down_arrow.svg";
  static const String backArrowIcon = "assets/common/icons/back_arrow.svg";
  static const String exploreIcon = "assets/common/icons/explore.svg";
  static const String micIcon = "assets/common/icons/mic.svg";
  static const String bread = "assets/common/icons/bread.png";
  static const String discount = "assets/common/icons/discount.svg";
  static const String rightArrowIcon = "assets/common/icons/right_arrow.svg";
  static const String editIcon = "assets/common/icons/edit.svg";
  static const String tickIcon = "assets/common/icons/tick.svg";
  static const String untickedIcon = "assets/common/icons/unticked.svg";
  static const String paymentHistoryIcon =
      "assets/common/icons/payment_history.svg";
  static const String customerSupportIcon =
      "assets/common/icons/customer_support.svg";
  static const String settingsIcon = "assets/common/icons/setting.svg";
  static const String paymentOptionsIcon = "assets/common/icons/wallet.svg";
  static const String rating = "assets/common/icons/rating.svg";
  static const String feedbackIcon = "assets/common/icons/message.svg";
  static const String logoutIcon = "assets/common/icons/logout.svg";

  static Widget getNetworkImage(String imageUrl,
      {String defaultImage = squarePlaceholder,
        double height = 90,
        double width = 90}) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      errorWidget:
          (BuildContext context, String exception, dynamic stackTrace) {
        return getAssetsSvgImage(defaultImage,
            height: height, width: width);
      },
    )
        : getAssetsSvgImage(defaultImage, height: height, width: width);
  }

  static Widget getAssetsSvgImage(String imagePath,
      {double height = 40, double width = 40, Color? color}) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
      fit: BoxFit.cover,
      color: color,
    );
  }
}


import 'package:flutter/material.dart';

import 'arch_utils/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  double deviceWidth = mediaQueryData.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.desktop;
  } else if (deviceWidth > 600) {
    return DeviceScreenType.tablet;
  } else {
    return DeviceScreenType.mobile;
  }
}

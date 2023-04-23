import 'package:bakery_app/common/utils/arch_utils/ui/responsize_builder.dart';
import 'package:flutter/material.dart';
import '../enums/device_screen_type.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({Key? key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          if (tablet != null) {
            return tablet!;
          }
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          if (desktop != null) {
            return desktop!;
          }
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          if (mobile != null) {
            return mobile!;
          }
        }
        return Container();
      },
    );
  }
}

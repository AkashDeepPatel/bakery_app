import '../../ui_utils.dart';
import 'sizing_information.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        var sizingInformation = SizingInformation(
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );

        return builder(context, sizingInformation);
      },
    );
  }
}

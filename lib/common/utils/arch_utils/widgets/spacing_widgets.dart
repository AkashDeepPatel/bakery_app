import 'package:bakery_app/common/utils/arch_utils/utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VSpace extends StatelessWidget {
  const VSpace(this.height, {Key? key}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (height).vdp());
  }
}

class HSpace extends StatelessWidget {
  const HSpace(this.width, {Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: (width).hdp());
  }
}

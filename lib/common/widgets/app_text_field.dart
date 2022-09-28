import 'package:flutter/material.dart';

import '../utils/arch_utils/widgets/spacing_widgets.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      this.title,
      this.textInputType,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText})
      : super(key: key);

  String? title;
  TextInputType? textInputType;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? ""),
        title != null ? const VSpace(8) : const SizedBox(),
        SizedBox(
          height: 50,
          child: TextField(
            keyboardType: textInputType ?? TextInputType.text,
            decoration: InputDecoration(
                hintText: hintText ?? "",
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon),
          ),
        ),
      ],
    );
  }
}

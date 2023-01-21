import 'package:flutter/material.dart';

import '../utils/arch_utils/widgets/spacing_widgets.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.title,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.controller,
    this.readOnly,
  }) : super(key: key);

  String? title;
  TextInputType? textInputType;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  TextEditingController? controller;
  bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.labelMedium,
              )
            : SizedBox(),
        title != null ? const VSpace(8) : const SizedBox(),
        SizedBox(
          height: 48,
          child: TextField(
            keyboardType: textInputType ?? TextInputType.text,
            controller: controller,
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
              hintText: hintText ?? "",
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ],
    );
  }
}

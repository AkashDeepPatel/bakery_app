import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';


class ImagePickDialog extends GetView<ProfileController> {
  const ImagePickDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      titlePadding: const EdgeInsets.all(0),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 8),
                child: Text(
                  "Image From",
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.clear))
            ],
          ),
          const Divider(
            height: 0,
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.setProfileImage(0);
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.camera),
                    // SvgPicture.asset(UserProfileAssets.camera),
                    Text("Camera"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.setProfileImage(1);
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: <Widget>[
                    // SvgPicture.asset(UserProfileAssets.gallery),
                    Icon(Icons.image_outlined),
                    Text("Gallery"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

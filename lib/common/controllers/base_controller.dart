import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../utils/arch_utils/enums/state_types.dart';
import '../utils/common_assets.dart';

class BaseController extends GetxController with StateMixin {
  StateType stateType = StateType.idle;
  setState(StateType state) {
    stateType = state;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _handleLocationPermission();
    getUserLocation();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
          'Location services are disabled. Please enable the services', '');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Location permissions are denied', '');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
          'Location permissions are permanently denied, we cannot request permissions.',
          '');
      return false;
    }
    return true;
  }

  RxList<Placemark> placemark = <Placemark>[].obs;
  getUserLocation() async {
    try {
      var response = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
          forceAndroidLocationManager: true);
      placemark.value =
          await placemarkFromCoordinates(response.latitude, response.longitude);
      debugPrint("<>$placemark");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Widget getIcon(String? icon, String name,
      {double height = 150, double width = 150}) {
    if (icon == null || icon.isEmpty) {
      return SvgPicture.asset(
        CommonAssets.squarePlaceholder,
        width: 150,
        height: 150,
      );
    }
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return FutureBuilder(
        future: getUrl(icon, name),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasError) {
            debugPrint(
                "Error in loading image for: $name $icon ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return SvgPicture.asset(
                CommonAssets.squarePlaceholder,
                width: height,
                height: width,
              );
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: height,
                width: width, imageUrl: snapshot.data.toString(),
                //color: AppColors.colorTextBlack,
              ),
            );
          } else {
            return SvgPicture.asset(
              CommonAssets.squarePlaceholder,
              width: height,
              height: width,
            );
          }
        },
      );
    });
  }

  static Future<String?> getUrl(String? icon, String name) async {
    if (icon == null || icon == "") return Future.value();
    try {
      return FirebaseStorage.instance.ref(icon).getDownloadURL();
    } catch (e) {
      debugPrint('Error occurred for $icon with tickerName : $name');
      return null;
    }
  }
}

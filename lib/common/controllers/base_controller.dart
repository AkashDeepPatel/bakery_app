import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../utils/arch_utils/enums/state_types.dart';

class BaseController extends GetxController with StateMixin {
  StateType stateType = StateType.idle;
  setState(StateType state) {
    stateType = state;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  getUserLocation() async {
    try {
      Position position;
      List<Placemark> placemark;
      var response = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium,
          forceAndroidLocationManager: true);
      position = response;
      placemark =
          await placemarkFromCoordinates(response.latitude, response.longitude);
      debugPrint("<>${placemark}");
    } catch (e) {
      debugPrint("${e.toString()}");
    }
  }
}

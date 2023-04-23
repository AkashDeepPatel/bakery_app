import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/wishlist_controller.dart';
import '../widgets/list_item_tile_widget.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      pageTitle: 'Wishlist',
      child: WishlistList(),
    );
  }
}

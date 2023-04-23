import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/models/product_model.dart';
import '../../common/screens/common_base_class.dart';
import '../controllers/home_controller.dart';
import '../widgets/list_item_tile_widget.dart';

class ListViewScreen extends GetView<HomeController> {
  ListViewScreen({Key? key, required this.listModel}) : super(key: key);
  static String routeName = "listViewScreen/";
  List<Product> listModel;
  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
        showAppBar: true,
        showSearchBar: true,
        child: ListView.builder(
            itemCount: controller.popularProductList.length,
            itemBuilder: (context, index) {
              return ListItemTileWidget(model: listModel[index]);
            }));
  }
}

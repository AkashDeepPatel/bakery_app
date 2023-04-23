import 'package:bakery_app/dashboard/screens/list_view_screen.dart';
import 'package:bakery_app/menu/screens/menu_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MenuRoutes {
  MenuRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => MenuScreen()),
  ];
}

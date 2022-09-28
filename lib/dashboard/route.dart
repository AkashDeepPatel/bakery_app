import 'package:bakery_app/dashboard/screens/list_view_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/dashboard_screen.dart';

class DashboardRoutes {
  DashboardRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => DashboardScreen()),
    GetPage(name: '/listViewScreen', page: () => ListViewScreen()),
  ];
}

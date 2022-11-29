import 'package:bakery_app/authentication/screens/login_screen.dart';
import 'package:bakery_app/cart/screens/cart_screen.dart';
import 'package:bakery_app/menu/bindings/menu_bindings.dart';
import 'package:bakery_app/walkthrough/screens/walkthrough_screens.dart';
import 'package:bakery_app/welcome_screen/screens/welcome_screen.dart';
import 'package:get/get.dart';
import '../authentication/bindings/auth_bindings.dart';
import '../authentication/route.dart';
import '../authentication/screens/auth_gate.dart';
import '../authentication/screens/create_account_scren.dart';
import '../authentication/screens/otp_verification_screen.dart';
import '../cart/bindings/cart_bindings.dart';
import '../cart/route.dart';
import '../dashboard/bindings/dashboard_bindings.dart';
import '../dashboard/screens/dashboard_screen.dart';
import '../menu/route.dart';
import '../menu/screens/menu_screen.dart';
import '../orders/bindings/orders_bindings.dart';
import '../orders/route.dart';
import '../orders/screens/orders_screen.dart';
import '../profile/bindings/profile_bindings.dart';
import '../profile/route.dart';
import '../profile/screens/profile_screen.dart';
import '../splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(
        name: '/auth',
        binding: AuthBinding(),
        page: () => const AuthGate(),
        children: AuthRoutes.routes),
    GetPage(
        name: '/dashboard',
        page: () => DashboardScreen(),
        binding: DashboardBindings()),
    GetPage(
      name: '/orders',
      binding: OrdersBindings(),
      page: () => const OrdersScreen(),
      children: OrdersRoutes.routes,
    ),
    GetPage(
      name: '/menu',
      binding: MenuBindings(),
      page: () => MenuScreen(),
      children: MenuRoutes.routes,
    ),
    GetPage(
      name: '/cart',
      binding: CartBindings(),
      page: () => CartScreen(),
      children: CartRoutes.routes,
    ),
    GetPage(
      name: '/profile',
      binding: ProfileBindings(),
      page: () => ProfileScreen(),
      children: ProfileRoutes.routes,
    ),
  ];
}

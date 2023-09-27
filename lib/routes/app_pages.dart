import 'package:webart_assignment/modules/dashboard/view/dashboard_view.dart';
import 'package:webart_assignment/modules/auth/bindings/auth_bindings.dart';
import 'package:webart_assignment/modules/auth/view/register_view.dart';
import 'package:webart_assignment/modules/auth/view/login_view.dart';
import '../modules/dashboard/bindings/dashboard_bindings.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/view/splash_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashBoardView(),
      binding: DashBoardBindings(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashBindings(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
  ];
}

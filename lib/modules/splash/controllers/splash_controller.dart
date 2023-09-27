import 'package:webart_assignment/services/auth_service.dart';
import '../../../routes/app_routes.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> sizeAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    sizeAnimation = Tween<double>(begin: 50, end: 250).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.toNamed(
          AuthService().isUserLoggedIn() ? Routes.DASHBOARD : Routes.LOGIN,
        );
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    );
  }
}

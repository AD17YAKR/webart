import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashBoardController extends GetxController {
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;

  @override
  void onInit() {
    super.onInit();
    getName();
  }

  void getName() {
    final box = GetStorage();
    name.value = box.read('name') ?? '';
    email.value = box.read('email') ?? '';
    phone.value = box.read('phone') ?? '';
  }
}

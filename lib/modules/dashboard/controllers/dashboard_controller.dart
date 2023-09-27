import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashBoardController extends GetxController {
  RxString name = "".obs;
  @override
  void onInit() {
    super.onInit();
    name.value = getName();
  }

  String getName() {
    final box = GetStorage();
    String name = box.read('name') ?? '';
    return name;
  }
}

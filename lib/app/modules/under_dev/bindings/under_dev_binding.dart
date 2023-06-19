import 'package:get/get.dart';

import '../controllers/under_dev_controller.dart';

class UnderDevBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnderDevController>(
      () => UnderDevController(),
    );
  }
}

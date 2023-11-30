import 'package:get/get.dart';

import '../controllers/appwrite_controller.dart';

class AppwriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppwriteController>(
      () => AppwriteController(),
    );
  }
}

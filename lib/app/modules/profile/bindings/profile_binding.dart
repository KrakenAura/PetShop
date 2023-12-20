import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(imagePicker: ImagePicker()),
    );
  }
}

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Get.snackbar("Profile", "Sukses");
      imagePath.value = image.path.toString();
    }
  }

  Future getImages() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      Get.snackbar("Profile", "Sukses");
      imagePath.value = image.path.toString();
    }
  }
}

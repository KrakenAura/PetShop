// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileController extends GetxController {
//   RxString imagePath = ''.obs;

//   Future getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       Get.snackbar("Profile", "Sukses");
//       imagePath.value = image.path.toString();
//     }
//   }

//   Future getImages() async {
//     final ImagePicker _picker = ImagePicker();
//     final image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       Get.snackbar("Profile", "Sukses");
//       imagePath.value = image.path.toString();
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ImagePicker imagePicker;
  RxString imagePath = ''.obs;

  ProfileController({required this.imagePicker});

  Future<void> getImage() async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        Get.snackbar("Profile", "Sukses");
        imagePath.value = pickedFile.path;
      } else {
        throw Exception("Image capture canceled");
      }
    } catch (e) {
      Get.snackbar("Profile", "Error: $e");
      imagePath.value =
          ''; // Set a default value or leave it empty based on your requirement
    }
  }

  Future<void> getImages() async {
    try {
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        Get.snackbar("Profile", "Sukses");
        imagePath.value = image.path;
      } else {
        throw Exception("Image capture canceled");
      }
    } catch (e) {
      Get.snackbar("Profile", "Error: $e");
      imagePath.value =
          ''; // Set a default value or leave it empty based on your requirement
    }
  }
}

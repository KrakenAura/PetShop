import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:pet/app/modules/profile/controllers/profile_controller.dart';

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  late ProfileController controller;
  late MockImagePicker mockImagePicker;

  setUp(() {
    mockImagePicker = MockImagePicker();
    controller = ProfileController(imagePicker: mockImagePicker);
    Get.testMode = true;
  });

  test('getImage success', () async {
    // Arrange
    final imageSource = ImageSource.gallery;
    final pickedFile = XFile(r'..\image\ProfilePict.jpg');
    when(mockImagePicker.pickImage(source: imageSource))
        .thenAnswer((_) async => pickedFile);

    // Act
    await controller.getImage();

    // Assert
    verify(mockImagePicker.pickImage(source: ImageSource.gallery)).called(1);
    expect(controller.imagePath.value, r'..\image\ProfilePict.jpg');
  });

  test('getImage error', () async {
    // Arrange
    final imageSource = ImageSource.gallery;
    when(mockImagePicker.pickImage(source: imageSource))
        .thenThrow(Exception("Image capture canceled"));

    // Act
    await controller.getImage();

    // Assert
    verify(mockImagePicker.pickImage(source: ImageSource.gallery)).called(1);
    expect(controller.imagePath.value, '');
  });

  test('getImages success', () async {
    // Arrange
    final pickedFile = XFile(r'..\image\ProfilePict.jpg');
    when(mockImagePicker.pickImage(source: ImageSource.camera))
        .thenAnswer((_) async => pickedFile);

    // Act
    await controller.getImages();

    // Assert
    verify(mockImagePicker.pickImage(source: ImageSource.camera)).called(1);
    expect(controller.imagePath.value, r'..\image\ProfilePict.jpg');
  });

  test('getImages error', () async {
    // Arrange
    when(mockImagePicker.pickImage(source: ImageSource.camera))
        .thenThrow(Exception("Image capture canceled"));

    // Act
    await controller.getImages();

    // Assert
    verify(mockImagePicker.pickImage(source: ImageSource.camera)).called(1);
    expect(controller.imagePath.value, '');
  });
}

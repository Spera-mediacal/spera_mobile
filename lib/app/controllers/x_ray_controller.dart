import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class XRayController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
}

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class XRayController extends GetxController {
  final _imagePath = Rx<String?>(null);
  final _isAnalyzing = false.obs;

  String? get imagePath => _imagePath.value;
  bool get isAnalyzing => _isAnalyzing.value;
  bool get hasImage => _imagePath.value != null;

  final _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        _imagePath.value = image.path;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> analyzeImage() async {
    if (!hasImage) return;

    try {
      _isAnalyzing.value = true;
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar(
        'Success',
        'Image analyzed successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to analyze image',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isAnalyzing.value = false;
    }
  }

  void clearImage() {
    _imagePath.value = null;
  }
}
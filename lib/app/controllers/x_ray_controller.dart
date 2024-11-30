import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/custom_snack_bar.dart';

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
      const CustomSnackBar(
        icon: HugeIcons.strokeRoundedAlert02,
        title: 'Error',
        message: 'Failed to pick image',
        textColor: AppColors.wrongColor,
      ).show();
    }
  }

  Future<void> analyzeImage() async {
    if (!hasImage) return;

    try {
      _isAnalyzing.value = true;
      await Future.delayed(const Duration(seconds: 2));
      const CustomSnackBar(
              title: 'Success', message: 'Image analyzed successfully')
          .show();
    } catch (e) {
      const CustomSnackBar(
        title: 'Error',
        message: 'Failed to analyze image',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
    } finally {
      _isAnalyzing.value = false;
    }
  }

  void clearImage() {
    _imagePath.value = null;
  }
}

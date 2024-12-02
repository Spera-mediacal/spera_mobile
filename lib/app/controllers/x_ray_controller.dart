import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/constants.dart';
import 'package:spera_mobile/utils/global_widgets/custom_snack_bar.dart';

class XRayController extends GetxController {
  final _imagePath = Rx<String?>(null);
  final _isAnalyzing = false.obs;
  final _analysisResult = Rx<Map<String, dynamic>?>(null);

  String? get imagePath => _imagePath.value;
  bool get isAnalyzing => _isAnalyzing.value;
  bool get hasImage => _imagePath.value != null;
  Map<String, dynamic>? get analysisResult => _analysisResult.value;

  final _picker = ImagePicker();
  final _dio = dio.Dio();

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _imagePath.value = image.path;
        // Reset previous analysis result
        _analysisResult.value = null;
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
    if (!hasImage) {
      const CustomSnackBar(
        title: 'Error',
        message: 'Please pick an image first',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();
      return;
    }

    try {
      _isAnalyzing.value = true;

      final file = File(_imagePath.value!);
      final formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      final response = await _dio.post(
        'http://${Constants.localIP}/api/xray',
        data: formData,
        options: dio.Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      _analysisResult.value = response.data;

      const CustomSnackBar(
        title: 'Success',
        message: 'Image analyzed successfully',
      ).show();
      print(response.data);
    } catch (e) {
      CustomSnackBar(
        title: 'Error',
        message: 'Failed to analyze image: ${e.toString()}',
        textColor: AppColors.wrongColor,
        icon: HugeIcons.strokeRoundedAlert02,
      ).show();

      // Reset analysis result in case of error
      _analysisResult.value = null;
    } finally {
      _isAnalyzing.value = false;
    }
  }

  void clearImage() {
    _imagePath.value = null;
    _analysisResult.value = null;
  }
}
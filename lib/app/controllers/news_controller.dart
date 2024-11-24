import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/news_article.dart';

class NewsController extends GetxController {
  final String _apiKey = '711803c4c9f74be09393efd59ec52e64';
  final String _url =
      'https://newsapi.org/v2/top-headlines?country=us&category=health';
  final Dio _dio = Dio();

  var isLoading = true.obs;
  var articles = <NewsArticle>[].obs;

  @override
  void onInit() {
    fetchMedicalNews();
    super.onInit();
  }

  Future<void> fetchMedicalNews() async {
    try {
      isLoading(true);
      final response = await _dio.get('$_url&apiKey=$_apiKey');
      if (response.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(response.data);
        articles.assignAll(newsResponse.articles);
      } else {
        Get.snackbar('Error', 'Failed to load news articles');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}

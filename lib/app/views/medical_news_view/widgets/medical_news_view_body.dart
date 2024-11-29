import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../controllers/news_controller.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';

class MedicalNewsViewBody extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());

  MedicalNewsViewBody({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                child: Text(
                  'medicalNews'.tr,
                  style: AppTextStyles.textStyle35,
                ),
              ),
              SizedBox(height: screenHeight(context) * 0.04),
              Obx(() {
                if (_newsController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (_newsController.articles.isEmpty) {
                  return const Text('No news articles found.');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _newsController.articles.length,
                  itemBuilder: (context, index) {
                    final article = _newsController.articles[index];

                    if (article.title == '[Removed]') {
                      return const SizedBox.shrink();
                    }

                    return GestureDetector(
                      onTap: () {

                        if (article.url != null && article.url!.isNotEmpty) {
                       _launchURL(article.url!);
                        } else {
                          Get.snackbar('Error', 'No URL available for this article.');
                        }
                      },
                      child: Container(
                        height: screenHeight(context) * 0.3,
                        width: screenWidth(context) * 0.9,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: article.urlToImage != null ? NetworkImage(
                              article.urlToImage!,
                            ) : const AssetImage('assets/media/noImage.png'),

                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Gradient overlay
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            // Article title
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Text(
                                article.title ?? 'No Title',
                                style: AppTextStyles.textStyle24.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black.withOpacity(0.8),
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },

                );

              }),
              (screenHeight(context)*0.1).sh,
            ],
          ),
        ),
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

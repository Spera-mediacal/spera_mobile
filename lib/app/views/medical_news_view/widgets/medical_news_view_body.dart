import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/utils/colors.dart';

import '../../../controllers/news_controller.dart';
import '../../../models/news_article.dart';
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
            children: [
              const Text(
                'Medical News',
                style: AppTextStyles.textStyle35,
              ),
              (screenHeight(context) * 0.04).sh,
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
                    return Card(
                      color: AppColors.bgColor,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: article.urlToImage != null
                            ? Image.network(
                          article.urlToImage ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fimages%2Fno-image-available-picture-coming-soon-missing-photo-image-sign-illustration-vector%2F462936689&psig=AOvVaw2tC-kCUAyTK0r1GeqY3qUr&ust=1732566068783000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwjvkfTZ5fWJAxXlAfsDHbJaEkUQjRx6BAgAEBk',
                          width: 80,
                          fit: BoxFit.cover,
                        )
                            : null,
                        title: Text(article.title ?? 'No title',style: AppTextStyles.textStyle15.copyWith(color: AppColors.accentColor),),
                        subtitle: Text(article.description ?? 'No descripton',style: AppTextStyles.textStyle15.copyWith(color: AppColors.accentColor)),

                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


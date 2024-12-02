import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/controllers/donation_controller.dart';
 import 'package:spera_mobile/app/routes/app_router.dart';

import 'package:spera_mobile/app/views/home_view/widgets/side_title.dart';
import 'package:spera_mobile/app/views/home_view/widgets/welcome_text.dart';
import 'package:spera_mobile/utils/constants.dart';
import 'package:spera_mobile/utils/size_config.dart';
 import 'doctors_home_list.dart';
import 'home_app_bar.dart';
import '../../../../utils/global_widgets/home_containers_section.dart';

class HomeViewBody extends StatelessWidget {
    HomeViewBody({super.key});

  final DonationController donationController = Get.put(DonationController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            (screenHeight(context) * 0.03).sh,
                HomeAppBar(
              imageUrl:
              Constants.avatarImage,
              points: donationController.donationHistory.length * 10,
            ),
            (screenHeight(context) * 0.035).sh,
            const WelcomeText(

            ),
            (screenHeight(context) * 0.035).sh,
            const HomeContainersSection(),
            (screenHeight(context) * 0.03).sh,
            SideTitle(
              onTap: () {
                Get.toNamed(AppRoutes.doctorsViewPath);
              },
              title: "Doctors".tr,
              action: "viewAll".tr,
            ),
            const DoctorsHomeList(),
            (screenHeight(context) * 0.1).sh,
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spera_mobile/app/models/doctor_model.dart';
import 'package:spera_mobile/app/routes/app_router.dart';

import 'package:spera_mobile/app/views/home_view/widgets/side_title.dart';
import 'package:spera_mobile/app/views/home_view/widgets/welcome_text.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'doctor_item.dart';
import 'home_app_bar.dart';
import '../../../../utils/global_widgets/home_containers_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
            const HomeAppBar(
              imageUrl:
              'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-1/327166987_1266899077240055_4736176644079930507_n.jpg?stp=c0.5.768.768a_dst-jpg_s160x160&_nc_cat=107&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=MY_XTcPzcTYQ7kNvgFLRCsf&_nc_zt=24&_nc_ht=scontent.fcai19-2.fna&_nc_gid=A5HZ8g4QZ94Jjob5SEqHKLx&oh=00_AYD165M5_MEphtgBZ7_-JMW7tgqhLPNMHpzHN46oNWlADg&oe=67456BBC',
              points: 200,
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
              title: "Doctors",
              action: "View All",
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return DoctorItem(
                  isOpenable: false,
                  doctor: DoctorModel(
                    id: 1,
                    name: 'name',
                    address: 'address',
                    image: 'image',
                    phone: 'phone',
                    specialization: 'specialization',
                    startHour: 'startHour', endHour: 'endHour',
                    joinDate: 'joinDate', workDays: ['TU', 'TH'],
                    rate: 2,),
                );
              },
            ),
            (screenHeight(context) * 0.1).sh,
          ],
        ),
      ),
    );
  }
}

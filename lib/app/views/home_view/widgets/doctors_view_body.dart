import 'package:flutter/material.dart';
import 'package:spera_mobile/app/views/home_view/widgets/doctor_item.dart';
import 'package:spera_mobile/utils/size_config.dart';

import '../../../models/doctor_model.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.05,
        vertical: screenHeight(context) * 0.02,
      ),
      child: ListView.builder(
        itemCount: dummyDoctors.length,
        itemBuilder: (context, index) {
          final doctor = dummyDoctors[index];
          return DoctorItem(doctor: doctor,isOpenable: true,);
        },
      ),
    );
  }
}

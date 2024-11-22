import 'package:flutter/material.dart';
import 'package:spera_mobile/utils/global_widgets/custom_info_container.dart';
import 'package:spera_mobile/utils/size_config.dart';

class MedicinesViewBody extends StatelessWidget {
  const MedicinesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
     final medicines = List.generate(
      10,
          (index) => {
        'title': 'Medicine ${index + 1}',
        'desc': 'Description for medicine ${index + 1}',
      },
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.05,
        vertical: screenHeight(context) * 0.02,
      ),
      child: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return CustomInfoContainer(
            title: medicine['title'] as String,
            desc: medicine['desc'] as String,
            price: 22,
          );
        },
      ),
    );
  }
}

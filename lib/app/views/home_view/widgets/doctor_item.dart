import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import 'day_item.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth(context) * 0.9,
      height: screenHeight(context) * 0.22,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Image.asset('assets/media/doctor.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (screenHeight(context) * 0.03).sh,
              Text(
                'Dr.Medhat',
                style: AppTextStyles.textStyle35.copyWith(
                    color: AppColors.accentColor, fontWeight: FontWeight.w300),
              ),
              Text(
                'Masalek',
                style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.4),
                    fontWeight: FontWeight.w300),
              ),(screenHeight(context) * 0.01).sh,
              SizedBox(
                width: screenWidth(context) * 0.5,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DayItem(
                        day: 'SA',
                        isAvailable: true,
                      ),
                      DayItem(
                        day: 'SU',
                        isAvailable: true,
                      ),
                      DayItem(
                        day: 'MO',
                        isAvailable: true,
                      ),
                      DayItem(
                        day: 'TA',
                        isAvailable: false,
                      ),
                      DayItem(
                        day: 'SA',
                        isAvailable: false,
                      ),
                      DayItem(
                        day: 'SA',
                        isAvailable: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:spera_mobile/app/models/doctor_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/text_styles.dart';
import 'day_item.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    required this.doctor,
    required this.isOpenable,
  });

  final DoctorModel doctor;
  final bool isOpenable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 50,
      splashColor: AppColors.accentColor,
      onTap: () {
        // Handle call action (e.g., launch phone dialer)
      },
      child: Container(
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
                SizedBox(height: screenHeight(context) * 0.03),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth(context) * 0.4,
                      child: Text(
                        doctor.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.textStyle27.copyWith(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Visibility(
                        visible: isOpenable,
                        child: IconButton(
                          onPressed: () => _showDoctorDetails(context, doctor),
                          icon: const Icon(
                            Icons.info,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  doctor.specialization,
                  style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor.withOpacity(0.4),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: screenHeight(context) * 0.01),
                SizedBox(
                  width: screenWidth(context) * 0.5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var day in ['SA', 'SU', 'MO', 'TU', 'WE', 'TH', 'FR'])
                          DayItem(
                            day: day,
                            isAvailable: doctor.workDays.contains(day),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDoctorDetails(BuildContext context, DoctorModel doctor) {
    showModalBottomSheet(
      backgroundColor: AppColors.greyColor,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                doctor.name,
                style: AppTextStyles.textStyle27.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor,
                ),
              ),
              const SizedBox(height: 10),
              _buildDoctorDetailRow(
                icon: Icons.location_on,
                label: 'Address:',
                value: doctor.address,
              ),
              _buildDoctorDetailRow(
                icon: Icons.phone,
                label: 'Phone:',
                value: doctor.phone,
              ),
              _buildDoctorDetailRow(
                icon: Icons.medical_services,
                label: 'Specialization:',
                value: doctor.specialization,
              ),
              _buildDoctorDetailRow(
                icon: Icons.schedule,
                label: 'Working Hours:',
                value: '${doctor.startHour} - ${doctor.endHour}',
              ),
              _buildDoctorDetailRow(
                icon: Icons.star,
                label: 'Rating:',
                value: doctor.rate.toStringAsFixed(1),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDoctorDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.accentColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label $value',
              style: AppTextStyles.textStyle24.copyWith(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

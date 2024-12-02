import 'package:flutter/material.dart';
import 'package:spera_mobile/app/models/doctor_model.dart';
import 'package:url_launcher/url_launcher.dart';
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
      onTap: () {},
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
                        for (var day in [
                          'Sa',
                          'Su',
                          'Mo',
                          'Tu',
                          'We',
                          'Th',
                          'Fr'
                        ])
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
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: doctor.image.isNotEmpty && Uri.tryParse(doctor.image)?.hasAbsolutePath == true
                          ? NetworkImage(doctor.image)
                          : const AssetImage('assets/media/doctor.png') as ImageProvider,
                      backgroundColor: AppColors.accentColor.withOpacity(0.8),
                      child: doctor.image.isEmpty
                          ? const Icon(Icons.person, size: 35, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: AppTextStyles.textStyle27.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            doctor.specialization,
                            style: AppTextStyles.textStyle15.copyWith(
                              color: AppColors.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.accentColor, thickness: 1),
                const SizedBox(height: 16),
                _buildEnhancedDoctorDetailRow(
                  icon: Icons.location_on,
                  label: 'Address',
                  value: doctor.address,
                ),
                const SizedBox(height: 12),
                _buildEnhancedDoctorDetailRow(
                  icon: Icons.phone,
                  label: 'Phone',
                  value: doctor.phone,
                ),
                const SizedBox(height: 12),
                _buildEnhancedDoctorDetailRow(
                  icon: Icons.schedule,
                  label: 'Working Hours',
                  value: '${doctor.startHour} - ${doctor.endHour}',
                ),
                const SizedBox(height: 12),
                _buildEnhancedDoctorDetailRow(
                  icon: Icons.star,
                  label: 'Rating',
                  value: '${doctor.rate.toStringAsFixed(1)} ★',
                ),
                const SizedBox(height: 12),
                const Divider(color: AppColors.accentColor, thickness: 1),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final phoneUrl = Uri.parse('tel:${doctor.phone}');
                      launchUrl(phoneUrl);
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text("Call Doctor"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEnhancedDoctorDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.accentColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.textStyle15.copyWith(
                  color: AppColors.accentColor.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: AppTextStyles.textStyle15.copyWith(
                  color: AppColors.accentColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}

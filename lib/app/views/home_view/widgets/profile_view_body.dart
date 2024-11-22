import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/glass_container.dart';
import 'package:spera_mobile/utils/global_widgets/logo_widget.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopSection(context),
          const SizedBox(height: 16),
          _buildDetailsSection(context),
        ],
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return GlassContainer(
      height: screenHeight(context) * 0.4,
      width: screenWidth(context),
      borderRadiusGeometry: const BorderRadius.vertical(
        bottom: Radius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          children: [
            _buildAppBar(context),
            SizedBox(height: screenHeight(context) * 0.03),
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://example.com/profile.jpg', // Replace with a safe, default image
              ),
            ),
            SizedBox(height: screenHeight(context) * 0.03),
            _buildStatsRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: AppColors.accentColor,
            size: 30,
          ),
        ),
        LogoWidget(
          width: screenWidth(context) * 0.1,
          height: screenHeight(context) * 0.03,
        ),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatColumn('Age', 22),
        _buildVerticalDivider(context),
        _buildStatColumn('Points', 22),
        _buildVerticalDivider(context),
        _buildStatColumn('Donations', 22),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftColumn(context),
          _buildRightColumn(context),
        ],
      ),
    );
  }

  Widget _buildLeftColumn(BuildContext context) {
    return Column(
      children: [
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.32,
          width: screenWidth(context) * 0.44,
          title: 'BMI',
          value: '24',
          subtitle: 'Over Weight',
        ),
        const SizedBox(height: 16),
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.32,
          width: screenWidth(context) * 0.44,
          title: 'Blood',
          value: 'A+',
          subtitle: 'Blood Type',
        ),
      ],
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    return Column(
      children: [
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.32,
          width: screenWidth(context) * 0.44,
          title: 'Height',
          value: '180',
          subtitle: 'cm',
        ),
        const SizedBox(height: 16),
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.24,
          width: screenWidth(context) * 0.44,
          title: 'Weight',
          value: '90',
          subtitle: 'kg',
        ),
      ],
    );
  }

  Widget _buildGlassCard(
      BuildContext context, {
        required double height,
        required double width,
        required String title,
        required String value,
        required String subtitle,
      }) {
    return GlassContainer(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.textStyle27.copyWith(
                color: AppColors.whiteColor.withOpacity(0.3),
              ),
            ),
            Text(
              value,
              style: AppTextStyles.textStyle40.copyWith(
                fontSize: 60,
                color: AppColors.accentColor,
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyles.textStyle35.copyWith(
                color: AppColors.whiteColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String title, int value) {
    return Column(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle19.copyWith(
              color: AppColors.accentColor,
            ),
          ),
        ),
        Text(
          '$value',
          style: AppTextStyles.textStyle19.copyWith(
            color: AppColors.whiteColor.withOpacity(0.3),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.05,
      width: 3,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
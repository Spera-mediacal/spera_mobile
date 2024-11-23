import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/glass_container.dart';
import 'package:spera_mobile/utils/global_widgets/logo_widget.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';
import 'dart:io';

import '../../../services/shared_pref_service/sahred_pref_service.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await SharedPreferencesHelper.getName();
    setState(() {
      userName = name ?? 'Guest';
    });
  }

  Future<void> _createAndSharePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  'Profile Information',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Name: $userName',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 10),
              pw.Text('Personal Information:',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Age: 22', style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Points: 22', style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Donations: 22', style: const pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Text('Health Information:',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('BMI: 24 (Over Weight)',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Blood Type: A+',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Height: 180 cm',
                  style: const pw.TextStyle(fontSize: 16)),
              pw.Text('Weight: 90 kg', style: const pw.TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/profile.pdf');
    await file.writeAsBytes(await pdf.save());

    await Share.shareFiles(
      [file.path],
      text: 'My Profile Information',
    );
  }

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
            SizedBox(height: screenHeight(context) * 0.02),
            if (userName != null)
              Text(
                userName!,
                style: AppTextStyles.textStyle35.copyWith(
                  color: AppColors.whiteColor.withOpacity(0.8),
                ),
              ),
            SizedBox(height: screenHeight(context) * 0.02),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    'https://example.com/profile.jpg',
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _createAndSharePDF,
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedShare01,
                      color: AppColors.whiteColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
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
          height: screenHeight(context) * 0.28,
          width: screenWidth(context) * 0.44,
          title: 'BMI',
          value: '24',
          subtitle: 'Over Weight',
        ),
        const SizedBox(height: 16),
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.28,
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
          width: 100,
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

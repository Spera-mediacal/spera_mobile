import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spera_mobile/app/controllers/auth_controller.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/global_widgets/glass_container.dart';
import 'package:spera_mobile/utils/global_widgets/logo_widget.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';
import 'dart:io';

import '../../../../data/local_database_helper/database_helper.dart';
import '../../../../utils/constants.dart';
import '../../../controllers/donation_controller.dart';
import '../../../services/shared_pref_service/sahred_pref_service.dart';

class ProfileViewBody extends StatefulWidget {
  ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final donationController = Get.put(DonationController());
  String userId = '';
  bool isLoading = true;

  Future<void> _loadInitialData() async {
    final id = await SharedPreferencesHelper.getId();
    setState(() {
      userId = id ?? "000000"; // Assign the user ID
      isLoading = false; // Mark loading as complete
    });
    donationController.fetchDonationHistory(userId); // Fetch donation history
  }

  String? userName;
  Map<dynamic, dynamic>? userSetupData;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _loadUserName();
    _loadUserSetup();
  }

  Future<void> _loadUserName() async {
    final name = await SharedPreferencesHelper.getName();
    setState(() {
      userName = name ?? 'Guest';
    });
  }

  Future<void> _loadUserSetup() async {
    final dbHelper = DatabaseHelper();
    final data = await dbHelper.getUserSetup();
    setState(() {
      userSetupData = data;
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
              pw.Text('profAge: 22', style: const pw.TextStyle(fontSize: 16)),
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
    print('donationController.donationHistory.length');
    print(donationController.donationHistory.length);
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
    final AuthController controller = Get.put(AuthController());
    return GlassContainer(
      height: screenHeight(context) * 0.55,
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
                    Constants.avatarImage,
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
            (screenHeight(context) * 0.03).sh,
           _buildStatsRow(context),
            (screenHeight(context) * 0.03).sh,
            OutlinedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                Size(screenWidth(context) * 0.8, screenHeight(context) * 0.02),
              )),
              onPressed: () {
                controller.logout();
              },
              child: Text(
                'Logout',
                style: AppTextStyles.textStyle19.copyWith(
                  color: Colors.red,
                ),
              ),
            )
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
        _buildStatColumn('Age', userSetupData?['age'] ?? 35),
        _buildVerticalDivider(context),
        _buildStatColumn(
            'Points', donationController.donationHistory.length * 10),
        _buildVerticalDivider(context),
        _buildStatColumn(
            'Donations', donationController.donationHistory.length),
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

  String _getBMICategory(double? weight, double? height) {
    if (weight == null || height == null || height == 0) return 'N/A';

    final bmi = weight / ((height / 100) * (height / 100));
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Widget _buildLeftColumn(BuildContext context) {
    return Column(
      children: [
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.28,
          width: screenWidth(context) * 0.44,
          title: 'BMI',
          value: userSetupData != null &&
                  userSetupData?['weight'] != null &&
                  userSetupData?['height'] != null &&
                  userSetupData?['height'] != 0
              ? (userSetupData!['weight'].toDouble() /
                      ((userSetupData!['height'].toDouble() / 100) *
                          (userSetupData!['height'].toDouble() / 100)))
                  .toStringAsFixed(1)
              : 'N/A',
          subtitle: _getBMICategory(userSetupData?['weight']?.toDouble(),
              userSetupData?['height']?.toDouble()),
        ),
        const SizedBox(height: 16),
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.28,
          width: screenWidth(context) * 0.44,
          title: 'Blood',
          value: userSetupData?['blood_type'] ?? 'N/A',
          subtitle:
              userSetupData?['is_positive'] == 1 ? 'Positive' : 'Negative',
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
          value: userSetupData?['weight'].toString() ?? 'N/A',
          subtitle: 'cm',
        ),
        const SizedBox(height: 16),
        _buildGlassCard(
          context,
          height: screenHeight(context) * 0.24,
          width: screenWidth(context) * 0.44,
          title: userSetupData?['weight'].toString() ?? 'N/A',
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

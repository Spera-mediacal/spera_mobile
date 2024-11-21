import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spera_mobile/utils/colors.dart';
import 'package:spera_mobile/utils/constants.dart';
import 'package:spera_mobile/utils/size_config.dart';
import 'package:spera_mobile/utils/text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
                points: 122,
              ),
              (screenHeight(context) * 0.035).sh,
              const WelcomeText(
                name: 'Aburaya',
              ),
              (screenHeight(context) * 0.035).sh,
              const HomeContainersSection(),
              (screenHeight(context) * 0.03).sh,
              SideTitle(
                onTap: () {},
                title: "Doctors",
                action: "View All",
              ),
              (screenHeight(context) * 0.03).sh,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const DoctorItem();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
              ),
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

class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.isAvailable,
    required this.day,
  });

  final bool isAvailable;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.09,
      height: screenHeight(context) * 0.07,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isAvailable
            ? AppColors.accentColor
            : AppColors.whiteColor.withOpacity(0.4),
      ),
      child: Column(
        children: [
          (screenHeight(context) * 0.002).sh,
          CircleAvatar(
            radius: screenWidth(context) * 0.04,
            backgroundColor: AppColors.greyColor,
            child: Text(
              day,
              style: AppTextStyles.textStyle15.copyWith(
                color: isAvailable
                    ? AppColors.accentColor
                    : AppColors.whiteColor.withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SideTitle extends StatelessWidget {
  const SideTitle({
    super.key,
    required this.title,
    required this.action,
    required this.onTap,
  });

  final String title;
  final String action;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyle24,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            action,
            style: AppTextStyles.textStyle19.copyWith(
              color: AppColors.accentColor.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }
}

class HomeContainersSection extends StatelessWidget {
  const HomeContainersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeContainerButton(
          text: 'Check\nYour\nX-Rays',
          width: screenWidth(context) * 0.45,
          height: screenHeight(context) * 0.25,
          onTap: () {},
          color: AppColors.accentColor,
          fontSize: 30,
          iconData: HugeIcons.strokeRoundedPulse01,
        ),
        Column(
          children: [
            HomeContainerButton(
              text: 'Spera Bot',
              width: screenWidth(context) * 0.45,
              height: screenHeight(context) * 0.120,
              onTap: () {},
              color: AppColors.secAccentColor,
              fontSize: 20,
              iconData: HugeIcons.strokeRoundedChatBot,
            ),
            (screenHeight(context) * 0.01).sh,
            HomeContainerButton(
              text: 'Medicines',
              width: screenWidth(context) * 0.45,
              height: screenHeight(context) * 0.120,
              onTap: () {},
              color: AppColors.thirdAccentColor,
              fontSize: 20,
              iconData: HugeIcons.strokeRoundedMedicalMask,
            ),
          ],
        )
      ],
    );
  }
}

class HomeContainerButton extends StatelessWidget {
  const HomeContainerButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    required this.height,
    required this.width,
    required this.iconData,
    required this.color,
  });

  final Function() onTap;
  final String text;
  final double fontSize;
  final double height;
  final double width;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 25, 15),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.bgColor.withOpacity(0.2),
                  child: HugeIcon(
                    icon: iconData,
                    color: AppColors.bgColor,
                    size: 35,
                  ),
                ),
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowUpRight01,
                  color: AppColors.bgColor,
                  size: 35,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  textAlign: TextAlign.start,
                  text,
                  style: AppTextStyles.textStyle24.copyWith(
                    fontSize: fontSize,
                    color: AppColors.bgColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    int now = DateTime.now().hour;

    return Row(
      children: [
        Text(
          now > 12 ? 'Good night,\n $name' : 'Good morning,\n $name',
          textAlign: TextAlign.start,
          style: AppTextStyles.textStyle35.copyWith(
            color: AppColors.whiteColor.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.imageUrl,
    required this.points,
  });

  final String imageUrl;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          width: screenWidth(context) * 0.23,
          height: screenHeight(context) * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor.withOpacity(0.1),
            border: Border.all(
              color: AppColors.whiteColor.withOpacity(0.1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsPaths.coinAssetPath,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  6.sh,
                  Text(
                    "$points",
                    style: AppTextStyles.textStyle24
                        .copyWith(color: AppColors.accentColor),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

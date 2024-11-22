import 'package:flutter/cupertino.dart';
import 'package:spera_mobile/utils/global_widgets/dash_vertical_line.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/global_widgets/location_container.dart';

class StationsViewBody extends StatelessWidget {
  const StationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const LocationContainer(
              title: 'Giza',
              subTitle: '0104982048',
              colorSubTitle: AppColors.accentColor,
              colorTitle: AppColors.whiteColor,
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            ),
            DashedVerticalLine(),
            const LocationContainer(
              title: 'El Ezaby',
              subTitle: '1.4 km',
            )
          ],
        ),
      ),
    ));
  }
}

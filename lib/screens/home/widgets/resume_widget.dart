import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';
import '../../../global_widgets/spacers.dart';
import '../home_controller.dart';

class ResumeWidget extends StatelessWidget {
  ResumeWidget({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async => homeController.urlLaunch(
              'https://raw.githubusercontent.com/ZvonimirBabic/images/master/Babi%C4%87_CV.pdf'),
          child: Column(
            children: [
              SvgPicture.asset(
                ImageAssets.cvIcon,
                width: 60,
                height: 60,
                color: Theme.of(context).brightness == Brightness.dark
                    ? PortfolioAppColors.white
                    : PortfolioAppColors.black,
              ),
              const VerticalSpacer(
                size: 8,
              ),
              PortfolioText(
                  text: 'resume',
                  literal: true,
                  style: PortfolioTextStyles.bodyMobile),
            ],
          ),
        ),
      );
}

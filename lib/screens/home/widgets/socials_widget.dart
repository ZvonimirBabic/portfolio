import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';
import '../../../global_widgets/spacers.dart';
import '../home_controller.dart';

class SocialsWidget extends StatelessWidget {
  SocialsWidget({this.isDesktop = false, Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  final bool isDesktop;
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          PortfolioText(
              text: 'socials',
              style: isDesktop
                  ? PortfolioTextStyles.subtitle
                  : PortfolioTextStyles.subtitleMobile),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async => homeController
                      .urlLaunch('https://www.linkedin.com/in/zvonimirbabic1/'),
                  child: SvgPicture.asset(
                    ImageAssets.linkedInLogo,
                    width: isDesktop ? 60 : 45,
                    height: isDesktop ? 60 : 45,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? PortfolioAppColors.white
                        : PortfolioAppColors.black,
                  ),
                ),
              ),
              const HorizontalSpacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async => homeController
                      .urlLaunch('https://www.facebook.com/zvonimir.babic.1/'),
                  child: SvgPicture.asset(
                    ImageAssets.facebookLogo,
                    width: isDesktop ? 60 : 45,
                    height: isDesktop ? 60 : 45,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? PortfolioAppColors.white
                        : PortfolioAppColors.black,
                  ),
                ),
              ),
              const HorizontalSpacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async => homeController
                      .urlLaunch('https://www.instagram.com/zvonimirbabic1/'),
                  child: SvgPicture.asset(
                    ImageAssets.instagramLogo,
                    width: isDesktop ? 60 : 45,
                    height: isDesktop ? 60 : 45,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? PortfolioAppColors.white
                        : PortfolioAppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/home/home_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';
import '../../../global_widgets/spacers.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({this.isDesktop = false, Key? key}) : super(key: key);
  final bool isDesktop;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.work_outline,
                size: isDesktop ? 60 : 45,
              ),
              PortfolioText(
                  text: 'experience',
                  style: isDesktop
                      ? PortfolioTextStyles.subtitle
                      : PortfolioTextStyles.subtitleMobile),
            ],
          ),
          ExperienceWidgetEntry(
              yearStart: 2021,
              url: 'https://cinnamon.agency/',
              title: 'Flutter Developer',
              name: 'Cinnamon Agency',
              isDesktop: isDesktop,
              icon: ImageAssets.cinnamonAgencyLogo),
          const VerticalSpacer(),
        ],
      );
}

class ExperienceWidgetEntry extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  ExperienceWidgetEntry({
    required this.title,
    required this.name,
    required this.yearStart,
    required this.url,
    required this.isDesktop,
    required this.icon,
    this.yearEnd,
    Key? key,
  }) : super(key: key);

  final String title;
  final String name;
  final int yearStart;
  final int? yearEnd;
  final String url;
  final bool isDesktop;
  final String icon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async => homeController.urlLaunch(url),
            child: Material(
              shadowColor: Colors.black,
              color: Theme.of(context).brightness == Brightness.light
                  ? PortfolioAppColors.tabColorLight
                  : PortfolioAppColors.tabColorDark,
              borderRadius: BorderRadius.circular(18),
              elevation: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PortfolioText(
                              text: title,
                              literal: true,
                              style: isDesktop
                                  ? PortfolioTextStyles.bodyBold
                                  : PortfolioTextStyles.bodyBoldMobile),
                          PortfolioText(
                              text: name,
                              literal: true,
                              dayColor: PortfolioAppColors.portfolioColorBlue,
                              nightColor:
                                  PortfolioAppColors.portfolioColorLightBlue,
                              style: isDesktop
                                  ? PortfolioTextStyles.body
                                  : PortfolioTextStyles.bodyMobile),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                              ),
                              const HorizontalSpacer(
                                size: 8,
                              ),
                              PortfolioText(
                                  text:
                                      '$yearStart - ${yearEnd ?? 'ongoing'.tr}',
                                  literal: true,
                                  style: isDesktop
                                      ? PortfolioTextStyles.small
                                      : PortfolioTextStyles.smallMobile),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(icon),
                          repeat: ImageRepeat.repeatY,
                          invertColors:
                              Theme.of(context).brightness == Brightness.dark,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

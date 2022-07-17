import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/home/home_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';
import '../../../global_widgets/spacers.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({this.isDesktop = false, Key? key}) : super(key: key);

  final bool isDesktop;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.school_outlined,
                size: isDesktop ? 60 : 45,
              ),
              PortfolioText(
                  text: 'education',
                  style: isDesktop
                      ? PortfolioTextStyles.subtitle
                      : PortfolioTextStyles.subtitleMobile)
            ],
          ),
          EducationWidgetEntry(
            yearStart: 2018,
            url: 'https://www.tvz.hr/en/',
            title: 'Master of Information Technology',
            name: 'Zagreb University of Applied Sciences',
            yearEnd: 2020,
            isDesktop: isDesktop,
          ),
          EducationWidgetEntry(
            yearStart: 2015,
            url: 'https://www.tvz.hr/en/',
            title: 'Bachelor of Engineering in IT',
            name: 'Zagreb University of Applied Sciences',
            yearEnd: 2018,
            isDesktop: isDesktop,
          ),
          EducationWidgetEntry(
            yearStart: 2011,
            url: 'http://www.ss-dugo-selo.skole.hr/',
            title: 'Computer technician',
            name: 'Dugo Selo High School',
            yearEnd: 2015,
            isDesktop: isDesktop,
          ),
          const VerticalSpacer(),
        ],
      );
}

class EducationWidgetEntry extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  EducationWidgetEntry({
    required this.title,
    required this.name,
    required this.yearStart,
    required this.yearEnd,
    required this.url,
    required this.isDesktop,
    Key? key,
  }) : super(key: key);

  final String title;
  final String name;
  final int yearStart;
  final int yearEnd;
  final String url;
  final bool isDesktop;

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
              child: SizedBox(
                width: 400,
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
                              text: '$yearStart - $yearEnd',
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
            ),
          ),
        ),
      );
}

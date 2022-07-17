import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/global_widgets/smooth_scroll_web.dart';
import 'package:portfolio/screens/home/home_controller.dart';
import 'package:portfolio/screens/home/widgets/education_widget.dart';
import 'package:portfolio/screens/home/widgets/experience_widget.dart';
import 'package:portfolio/screens/home/widgets/interactive_widget.dart';
import 'package:portfolio/screens/home/widgets/resume_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/images.dart';
import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';
import '../../../global_widgets/spacers.dart';
import '../widgets/about_me_widget.dart';
import '../widgets/socials_widget.dart';

class HomeScreenDesktopLayout extends StatelessWidget {
  HomeScreenDesktopLayout({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: DecorationImage(
          alignment: Alignment.center,
          image: AssetImage(ImageAssets.pixelWorld),
        ),
      ),
      child: SmoothScrollWeb(
        controller: homeController.scrollController,
        child: SingleChildScrollView(
          controller: homeController.scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  VisibilityDetector(
                                    key: const Key('Name-Widget-Key-Desktop'),
                                    onVisibilityChanged: (VisibilityInfo info) {
                                      if (info.visibleFraction < 0.4) {
                                        homeController.shouldShowName = true;
                                      } else {
                                        homeController.shouldShowName = false;
                                      }
                                    },
                                    child: PortfolioText(
                                        text: 'Zvonimir Babić',
                                        literal: true,
                                        style: PortfolioTextStyles.title),
                                  ),
                                  VisibilityDetector(
                                    key: const Key('Job-Widget-Key-Desktop'),
                                    onVisibilityChanged: (VisibilityInfo info) {
                                      if (info.visibleFraction < 0.4) {
                                        homeController.shouldShowJob = true;
                                      } else {
                                        homeController.shouldShowJob = false;
                                      }
                                    },
                                    child: PortfolioText(
                                        text: 'Flutter Developer',
                                        literal: true,
                                        style: PortfolioTextStyles.subtitle),
                                  ),
                                ],
                              ),
                              const HorizontalSpacer(),
                              ResumeWidget(),
                            ],
                          ),
                          const VerticalSpacer(),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 600,
                              ),
                              child: const AboutMeWidget(
                                isDesktop: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: PortfolioText(
                                text: '"Nec dei nec reges at homines soli"',
                                literal: true,
                                style: PortfolioTextStyles.body),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              constraints: const BoxConstraints(
                                  maxWidth: 700,
                                  minHeight: 100,
                                  maxHeight: 500),
                              child: Image.network(
                                ImageAssets.profilePicture,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SocialsWidget(
                            isDesktop: true,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacer(
                size: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const EducationWidget(
                      isDesktop: true,
                    ),
                    Flexible(
                      child: Container(
                        constraints:
                            const BoxConstraints(maxWidth: 200, minWidth: 100),
                      ),
                    ),
                    const ExperienceWidget(
                      isDesktop: true,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              InteractiveWidget(
                isDesktop: true,
              ),
              const VerticalSpacer(
                size: 64,
              )
            ],
          ),
        ),
      ),
    );
  }
}

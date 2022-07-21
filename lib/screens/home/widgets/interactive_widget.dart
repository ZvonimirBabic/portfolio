import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/global_widgets/spacers.dart';

import '../../../constants/images.dart';
import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';
import '../../../global_widgets/web_fix_scroll_behavior_widget.dart';
import '../home_controller.dart';

class InteractiveWidget extends StatelessWidget {
  InteractiveWidget({this.isDesktop = false, Key? key}) : super(key: key);
  final bool isDesktop;

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.touch_app_outlined,
                  size: isDesktop ? 60 : 45,
                ),
                Flexible(
                  child: PortfolioText(
                      text: 'interactive',
                      style: isDesktop
                          ? PortfolioTextStyles.subtitle
                          : PortfolioTextStyles.subtitleMobile),
                ),
                if (isDesktop)
                  Flexible(
                    child: PortfolioText(
                        text: 'scaledForDesktop',
                        style: isDesktop
                            ? PortfolioTextStyles.subtitle
                            : PortfolioTextStyles.subtitleMobile),
                  ),
              ],
            ),
          ),
          const VerticalSpacer(
            size: 32,
          ),
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: homeController.pageController,
              pageSnapping: true,
              itemCount: homeController.exampleWidgets.length,
              scrollBehavior: AppScrollBehavior(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.s22Ultra,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 247.0),
                      child: FittedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PortfolioAppColors.white,
                          ),
                          width: 227,
                          height: 480,
                          child: MaterialApp(
                            home: Scaffold(
                                body: homeController.exampleWidgets[index]),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      );
}

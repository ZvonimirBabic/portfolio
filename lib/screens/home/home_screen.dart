import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/global_widgets/spacers.dart';

import '../../constants/text_styles.dart';
import '../../global_widgets/dark_mode_widget.dart';
import '../../global_widgets/font_size_widget.dart';
import '../../global_widgets/portfolio_text.dart';
import '../../global_widgets/responsive.dart';
import 'home_controller.dart';
import 'layouts/home_screen_desktop_layout.dart';
import 'layouts/home_screen_mobile_layout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final HomeController homeController = Get.find<HomeController>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Obx(
                    () => AnimatedOpacity(
                      opacity: homeController.shouldShowName ? 1 : 0,
                      duration: const Duration(milliseconds: 400),
                      child: PortfolioText(
                          text: 'Zvonimir Babić',
                          literal: true,
                          style: PortfolioTextStyles.subtitle),
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: homeController.shouldShowJob ? 1 : 0,
                      duration: const Duration(milliseconds: 400),
                      child: PortfolioText(
                          text: ' - Flutter Developer',
                          literal: true,
                          style: PortfolioTextStyles.subtitle),
                    ),
                  ),
                  const HorizontalSpacer(),
                  PortfolioText(
                      text:
                          'Work in progress please check back later for complete experience',
                      literal: true,
                      style: PortfolioTextStyles.subtitle),
                ],
              ),
              actions: <Widget>[
                PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  offset: const Offset(0, 45), // SET THE (X,Y) POSITION
                  iconSize: 30,
                  icon: const Icon(
                    Icons.settings, // CHOOSE YOUR CUSTOM ICON
                    color: Colors.white,
                  ),
                  // ignore: always_specify_types
                  itemBuilder: (BuildContext context) => <PopupMenuItem>[
                    // ignore: always_specify_types
                    PopupMenuItem(
                      enabled: false, // DISABLED THIS ITEM
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          PortfolioText(
                            text: 'theme',
                            style: PortfolioTextStyles.body,
                            textAlign: TextAlign.center,
                          ),
                          DarkModeWidget(),
                          Obx(
                            () => PortfolioText(
                              text: homeController.themeName,
                              style: PortfolioTextStyles.body,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(),
                          ),
                          PortfolioText(
                            text: 'fontSize',
                            style: PortfolioTextStyles.body,
                            textAlign: TextAlign.center,
                          ),
                          FontSizeWidget(),
                          Obx(
                            () => PortfolioText(
                              text: '${homeController.fontSize}%',
                              literal: true,
                              style: PortfolioTextStyles.body,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // WRITE YOUR CODE HERE
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            body: Responsive(
              mobile: const HomeScreenMobileLayout(),
              desktop: HomeScreenDesktopLayout(),
            ),
          ),
        ),
      );
}

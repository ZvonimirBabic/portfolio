import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/global_widgets/portfolio_text.dart';

import '../../global_widgets/portfolio_button.dart';
import '../../global_widgets/spacers.dart';
import 'two_fa_controller.dart';

class SuccessLoginScreen extends StatelessWidget {
  const SuccessLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TwoFAController twoFAController = Get.find<TwoFAController>();
    twoFAController.context = context;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PortfolioText(
            text: 'Welcome!',
            literal: true,
            style: PortfolioTextStyles.smallMobile,
            textAlign: TextAlign.center,
          ),
          const VerticalSpacer(),
          Obx(
            () => PortfolioButton(
              buttonText: 'Log out',
              onPressed: twoFAController.confirmPasscode,
              isLoading: twoFAController.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}

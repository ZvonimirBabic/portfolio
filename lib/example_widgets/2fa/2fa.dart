import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:portfolio/global_widgets/spacers.dart';

import '../../constants/text_styles.dart';
import '../../global_widgets/portfolio_button.dart';
import '../../global_widgets/portfolio_text.dart';
import 'two_fa_controller.dart';

class TwoFAWidget extends StatelessWidget {
  TwoFAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TwoFAController twoFAController = Get.put(TwoFAController());
    twoFAController.context = context;

    return Scaffold(
      body: AbsorbPointer(
        absorbing: twoFAController.isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PortfolioText(
              text: 'Enter your phone number to continue!',
              literal: true,
              style: PortfolioTextStyles.smallMobile,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InternationalPhoneNumberInput(
                scrollPadding: const EdgeInsets.all(0),
                selectorButtonOnErrorPadding: 0,
                spaceBetweenSelectorAndTextField: 0,
                countrySelectorScrollControlled: true,
                onInputChanged: (PhoneNumber number) {
                  twoFAController.phoneNumber = number.toString();
                },
                onInputValidated: (bool valid) {
                  twoFAController.phoneValid = valid;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorTextStyle: const TextStyle(color: Colors.black),
                formatInput: false,
                inputDecoration: const InputDecoration(isDense: false),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
              ),
            ),
            const VerticalSpacer(),
            Obx(
              () => PortfolioButton(
                buttonText: 'Log in',
                onPressed: twoFAController.login,
                disabled: twoFAController.phoneValid,
                isLoading: twoFAController.isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:portfolio/global_widgets/spacers.dart';

import 'two_fa_controller.dart';

class TwoFAWidget extends StatelessWidget {
  TwoFAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TwoFAController twoFAController = Get.put(TwoFAController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
          () => MaterialButton(
            child: const Text('Log in'),
            onPressed: twoFAController.phoneValid
                ? () {
                    twoFAController.login();
                  }
                : null,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:portfolio/global_widgets/spacers.dart';
import 'package:portfolio/global_widgets/web_fix_scroll_behavior_widget.dart';

import '../screens/home/widgets/interactive_controller.dart';

class TwoFAWidget extends StatelessWidget {
  TwoFAWidget({Key? key}) : super(key: key);

  final InteractiveController interactiveController =
      Get.put(InteractiveController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: Scaffold(
        body: Column(
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
                  interactiveController.phoneNumber = number.toString();
                },
                onInputValidated: (bool valid) {
                  interactiveController.phoneValid = valid;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorTextStyle: const TextStyle(color: Colors.black),
                formatInput: false,
                inputDecoration: InputDecoration(isDense: false),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
              ),
            ),
            const VerticalSpacer(),
            Obx(
              () => MaterialButton(
                child: const Text('Log in'),
                onPressed: interactiveController.phoneValid
                    ? interactiveController.login
                    : null,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

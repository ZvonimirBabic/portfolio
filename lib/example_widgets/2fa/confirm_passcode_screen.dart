import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/spacers.dart';
import 'otp_field_widget.dart';
import 'two_fa_controller.dart';

class ConfirmPasscodeScreen extends StatelessWidget {
  const ConfirmPasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TwoFAController twoFAController = Get.find<TwoFAController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: OtpInput(
                  controller: twoFAController.fieldOne, autoFocus: true),
            ),
            Flexible(
              child: OtpInput(
                  controller: twoFAController.fieldTwo, autoFocus: false),
            ),
            Flexible(
              child: OtpInput(
                  controller: twoFAController.fieldThree, autoFocus: false),
            ),
            Flexible(
              child: OtpInput(
                  controller: twoFAController.fieldFour, autoFocus: false),
            ),
            Flexible(
              child: OtpInput(
                  controller: twoFAController.fieldFive, autoFocus: false),
            ),
            Flexible(
              child: OtpInput(
                controller: twoFAController.fieldSix,
                autoFocus: false,
                last: true,
              ),
            ),
          ],
        ),
        const VerticalSpacer(),
        Obx(
          () => MaterialButton(
            child: const Text('Log in'),
            onPressed: twoFAController.passcodeEntered
                ? () {
                    twoFAController.confirmPasscode();
                  }
                : null,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

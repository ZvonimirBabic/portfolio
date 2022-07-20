import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/example_widgets/2fa/two_fa_controller.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool last;
  OtpInput(
      {required this.controller,
      required this.autoFocus,
      this.last = false,
      Key? key})
      : super(key: key);
  final TwoFAController twoFAController = Get.find<TwoFAController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(),
              counterText: '',
              hintStyle: TextStyle(color: Colors.black, fontSize: 10.0)),
          onChanged: (value) {
            if (value.length == 1) {
              twoFAController.digitEntered = true;
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}

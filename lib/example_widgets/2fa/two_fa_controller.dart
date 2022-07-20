import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/example_widgets/2fa/confirm_passcode_screen.dart';

import '../../constants/global_keys.dart';
import '../../services/logger_service.dart';

class TwoFAController extends GetxController
    with StateMixin<ConfirmationResult> {
  /// ------------------------
  /// LOGGER
  /// ------------------------
  final LoggerService logger = Get.find<LoggerService>();
  late ConfirmationResult confirmationResult;
  final BuildContext context = keys[0].currentContext!;
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  String _phoneNumber = '';
  final RxBool _phoneValid = false.obs;
  final RxBool _passcodeEntered = false.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get phoneValid => _phoneValid.value;
  bool get passcodeEntered => _passcodeEntered.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set phoneNumber(String value) => _phoneNumber = value;
  set phoneValid(bool value) => _phoneValid.value = value;
  set digitEntered(bool value) {
    _passcodeEntered.value = fieldOne.text.isNotEmpty &&
        fieldTwo.text.isNotEmpty &&
        fieldThree.text.isNotEmpty &&
        fieldFive.text.isNotEmpty &&
        fieldSix.text.isNotEmpty;
  }

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> login() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      confirmationResult = await auth.signInWithPhoneNumber(_phoneNumber);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPasscodeScreen(),
        ),
      );
    } catch (e) {
      const SnackBar snackBar = SnackBar(
        content: Text('There has been an error. Please try again later.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> confirmPasscode() async {
    _otp = fieldOne.text +
        fieldTwo.text +
        fieldThree.text +
        fieldFour.text +
        fieldFive.text +
        fieldSix.text;
    try {
      await confirmationResult.confirm(_otp ?? '');
      final SnackBar snackBar = SnackBar(
        content: Text('success'.tr),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      final SnackBar snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

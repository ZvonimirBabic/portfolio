import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/example_widgets/2fa/2fa.dart';
import 'package:portfolio/example_widgets/2fa/confirm_passcode_screen.dart';
import 'package:portfolio/example_widgets/2fa/success_login.dart';

import '../../services/logger_service.dart';

class TwoFAController extends GetxController
    with StateMixin<ConfirmationResult> {
  /// ------------------------
  /// LOGGER
  /// ------------------------
  final LoggerService logger = Get.find<LoggerService>();
  ConfirmationResult? confirmationResult;
  BuildContext? context;
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
  final RxBool _isLoading = false.obs;
  final RxBool _passcodeEntered = false.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get phoneValid => _phoneValid.value;
  bool get isLoading => _isLoading.value;
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

  void emptyOtpControllers() {
    fieldOne.text = '';
    fieldTwo.text = '';
    fieldThree.text = '';
    fieldFour.text = '';
    fieldFive.text = '';
    fieldSix.text = '';
  }

  Future<void> login() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      _isLoading.value = true;
      confirmationResult = await auth.signInWithPhoneNumber(_phoneNumber);
      Navigator.pushAndRemoveUntil(
          context!,
          MaterialPageRoute(
            builder: (context) => const ConfirmPasscodeScreen(),
          ),
          (Route<dynamic> route) => false);
      _isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      SnackBar snackBar = SnackBar(
        content: Text(
            e.message ?? 'There has been an error. Please try again later.'),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
      _isLoading.value = false;
    }
  }

  Future<void> logout() async {
    Navigator.pushAndRemoveUntil(
        context!,
        MaterialPageRoute(
          builder: (context) => TwoFAWidget(),
        ),
        (Route<dynamic> route) => false);
  }

  Future<void> confirmPasscode() async {
    _otp = fieldOne.text +
        fieldTwo.text +
        fieldThree.text +
        fieldFour.text +
        fieldFive.text +
        fieldSix.text;
    if (confirmationResult == null) {
      SnackBar snackBar = const SnackBar(
        content: Text(
            'There was an error processing your result. Please enter your phone number again!!'),
      );
      ScaffoldMessenger.of(context!).showSnackBar(snackBar);
      Navigator.pushAndRemoveUntil(
          context!,
          MaterialPageRoute(
            builder: (context) => TwoFAWidget(),
          ),
          (Route<dynamic> route) => false);
      emptyOtpControllers();

      return;
    }

    try {
      _isLoading.value = true;
      final UserCredential? userCredential =
          await confirmationResult?.confirm(_otp ?? '').then((value) {
        SnackBar snackBar = const SnackBar(
          content: Text('Congratulations!'),
        );
        ScaffoldMessenger.of(context!).showSnackBar(snackBar);
        Navigator.pushAndRemoveUntil(
            context!,
            MaterialPageRoute(
              builder: (context) => const SuccessLoginScreen(),
            ),
            (Route<dynamic> route) => false);
        _isLoading.value = false;
      }).catchError((error, stackTrace) async {
        final FirebaseAuthException exception = error as FirebaseAuthException;
        SnackBar snackBar = SnackBar(
          content: Text(exception.message ??
              'There has been an error. Please try again later.'),
        );
        ScaffoldMessenger.of(context!).showSnackBar(snackBar);
        _isLoading.value = false;
        emptyOtpControllers();
        return;
      });
    } on FirebaseAuthException catch (e) {
    }
  }
}

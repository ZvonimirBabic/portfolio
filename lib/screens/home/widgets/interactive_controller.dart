import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../services/logger_service.dart';

class InteractiveController extends GetxController {
  /// ------------------------
  /// LOGGER
  /// ------------------------
  final LoggerService logger = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  String _phoneNumber = '';
  final RxBool _phoneValid = false.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get phoneValid => _phoneValid.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set phoneNumber(String value) => _phoneNumber = value;
  set phoneValid(bool value) => _phoneValid.value = value;

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

// Wait for the user to complete the reCAPTCHA & for an SMS code to be sent.
    ConfirmationResult confirmationResult =
        await auth.signInWithPhoneNumber(_phoneNumber);

    log('phone number is $_phoneNumber');
  }
}

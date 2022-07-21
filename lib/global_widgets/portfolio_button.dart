import 'package:flutter/material.dart';

class PortfolioButton extends StatelessWidget {
  const PortfolioButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.disabled = false,
      required this.isLoading})
      : super(key: key);
  final String buttonText;
  final dynamic onPressed;
  final bool disabled;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(buttonText),
      onPressed: disabled
          ? () {
              onPressed();
            }
          : null,
      color: Colors.blue,
    );
  }
}

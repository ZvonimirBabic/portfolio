import 'package:flutter/material.dart';

class TwoFAWidget extends StatelessWidget {
  const TwoFAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextField(),
        MaterialButton(
          onPressed: () {},
          color: Colors.blue,
        )
      ],
    );
  }
}

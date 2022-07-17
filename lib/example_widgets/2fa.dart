import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:portfolio/global_widgets/spacers.dart';

class TwoFAWidget extends StatelessWidget {
  const TwoFAWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            )),
        const VerticalSpacer(),
        MaterialButton(
          child: const Text('Log in'),
          onPressed: () {},
          color: Colors.blue,
        )
      ],
    );
  }
}

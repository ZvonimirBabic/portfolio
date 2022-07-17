import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';
import '../../../global_widgets/portfolio_text.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({this.isDesktop = false, Key? key}) : super(key: key);

  final bool isDesktop;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PortfolioText(
              text: 'about_me',
              style: isDesktop
                  ? PortfolioTextStyles.body
                  : PortfolioTextStyles.bodyMobile),
          PortfolioText(
              textAlign: TextAlign.start,
              text: 'about_me2',
              style: isDesktop
                  ? PortfolioTextStyles.body
                  : PortfolioTextStyles.bodyMobile),
        ],
      );
}

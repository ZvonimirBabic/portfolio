import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/home/home_controller.dart';

import '../../../constants/colors.dart';

class PortfolioText extends StatelessWidget {
  PortfolioText(
      {required this.text,
      required this.style,
      this.textAlign,
      this.dayColor,
      this.nightColor,
      this.literal = false,
      Key? key})
      : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  final String text;
  final bool literal;
  final TextStyle style;
  final Color? dayColor;
  final Color? nightColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) => Obx(
        () => Text(
          literal ? text : text.tr,
          style: style.copyWith(
            fontSize: style.fontSize! * homeController.fontSize / 100,
            color: Theme.of(context).brightness == Brightness.light
                ? dayColor ?? PortfolioAppColors.textColorLight
                : nightColor ?? PortfolioAppColors.textColorDark,
          ),
          textAlign: textAlign ?? TextAlign.start,
        ),
      );
}

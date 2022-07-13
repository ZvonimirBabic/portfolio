import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/home/home_controller.dart';

class FontSizeWidget extends StatelessWidget {
  FontSizeWidget({Key? key}) : super(key: key);

  final HomeController splashController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: splashController.decreaseFont,
              icon: const Icon(Icons.remove)),
          Flexible(
            child: Obx(
              () => Slider(
                divisions: 10,
                value: splashController.fontSize.toDouble(),
                onChanged: (double value) {
                  splashController.fontSize = value.toInt();
                },
                min: 100,
                max: 150,
              ),
            ),
          ),
          IconButton(
              onPressed: splashController.increaseFont,
              icon: const Icon(Icons.add)),
        ],
      );
}

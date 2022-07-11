import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({this.size, Key? key}) : super(key: key);

  final double? size;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: size ?? 16,
        width: 0,
      );
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({this.size, Key? key}) : super(key: key);
  final double? size;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 0,
        width: size ?? 16,
      );
}

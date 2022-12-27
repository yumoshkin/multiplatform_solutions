import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({
    Key? key,
    this.narrow,
    this.wide,
    this.ultraWide,
    this.other,
  }) : super(key: key);
  final Widget? narrow;
  final Widget? wide;
  final Widget? ultraWide;
  final Widget? other;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1920 && ultraWide != null) {
      return wide!;
    }

    if (width >= 720 && wide != null) {
      return wide!;
    }

    if (narrow != null) {
      return narrow!;
    }

    if (other != null) {
      return other!;
    }

    throw Exception('Can not match layout');
  }
}

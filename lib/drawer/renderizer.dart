import 'package:flutter/material.dart';

class Renderizer {
  static bool isDesktop(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return !isMobile & !isPortrait;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

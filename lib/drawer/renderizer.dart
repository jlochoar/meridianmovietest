import 'package:flutter/material.dart';

class Renderizer {
  static bool isDesktop(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return !isMobile & !isPortrait;
  }
}

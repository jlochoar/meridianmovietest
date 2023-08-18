import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorGenerator {
  static Color generateRandomColor() {
    Color newColor;

    do {
      newColor = _generateRandomColor();
    } while (newColor.computeLuminance() < 0.5);

    return newColor;
  }

  static Color _generateRandomColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);

    return Color.fromARGB(255, red, green, blue);
  }
}

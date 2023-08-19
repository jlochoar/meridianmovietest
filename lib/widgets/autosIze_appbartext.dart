import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeAppBarText extends StatelessWidget {
  final String text;

  const AutoSizeAppBarText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      overflow: TextOverflow.clip,
      maxLines: 1,
      textScaleFactor: 1.4,
      minFontSize: 2,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}

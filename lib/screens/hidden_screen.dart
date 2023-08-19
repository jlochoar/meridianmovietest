// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:movietest/drawer/renderizer.dart';

class HiddenScreen extends StatelessWidget {
  final double _viewportFraction = 1;
  const HiddenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Renderizer.isDesktop(context)
        ? Renderizer.getHeight(context) * _viewportFraction
        : Renderizer.getHeight(context) * _viewportFraction * 9 / 16;
    final double width = Renderizer.isDesktop(context)
        ? Renderizer.getWidth(context) * _viewportFraction * 9 / 16
        : Renderizer.getWidth(context) * _viewportFraction;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Scaffold(
          body: Center(
              child: Stack(children: [
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/gato.gif'),
                    fit: BoxFit.fill),
              ),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8),
            ),
            const Text('Toca para regresar', textAlign: TextAlign.center)
          ])),
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HiddenScreen extends StatelessWidget {
  const HiddenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage('assets/gato.gif'),
                        fit: BoxFit.fill),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(8),
                ))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movietest/database/api.dart';
import 'dart:typed_data';

class FutureImageWidget extends StatelessWidget {
  final String imageUrl;
  final Size size;

  const FutureImageWidget(
      {super.key, required this.imageUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: ApiMovieTest.fetchImage(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              width: size.width,
              height: size.height,
              child: const Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.statusCode != 200) {
          return const Center(child: Text('Failed to load image.'));
        } else {
          final Uint8List imageBytes = snapshot.data!.bodyBytes;
          return SizedBox(
            width: size.width,
            height: size.height,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.memory(imageBytes),
            ),
          );
        }
      },
    );
  }
}

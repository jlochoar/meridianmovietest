import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movietest/database/api.dart';
import 'dart:typed_data';

class PosterWidget extends StatelessWidget {
  final String imageUrl;

  const PosterWidget({super.key, required this.imageUrl});

  Future<Response> getImage() {
    return ApiMovieTest.fetchImage(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: getImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.statusCode != 200) {
          return const Center(child: Text('Failed to load image.'));
        } else {
          final Uint8List imageBytes = snapshot.data!.bodyBytes;
          return FittedBox(
            fit: BoxFit.cover,
            child: Image.memory(imageBytes),
          );
        }
      },
    );
  }
}

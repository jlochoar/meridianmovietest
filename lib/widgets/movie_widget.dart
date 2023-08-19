import 'package:flutter/material.dart';
import 'package:movietest/drawer/renderizer.dart';
import 'package:movietest/screens/movie_details_screen.dart';
import 'package:movietest/widgets/future_image_widget.dart';
import '../models/movie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size imageSize = Size(Renderizer.getWidth(context) * 0.8,
        Renderizer.getHeight(context) * 0.6);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: movie),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AutoSizeText(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textScaleFactor: 1.7,
                  minFontSize: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 176, 171, 171),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
              child: FutureImageWidget(
                imageUrl: movie.posterPath,
                size: imageSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

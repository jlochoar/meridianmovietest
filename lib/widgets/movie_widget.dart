import 'package:flutter/material.dart';
import 'package:movietest/screens/movie_details_screen.dart';
import 'package:movietest/widgets/future_image_widget.dart';
import '../models/movie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MovieWidget extends StatefulWidget {
  final Movie movie;
  const MovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  final AutoSizeGroup _group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final Size imageSize = Size(MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.height * 0.6);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movie: widget.movie)));
      },
      child: Card(
        color: const Color.fromARGB(255, 24, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AutoSizeText(
                  widget.movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  group: _group,
                  presetFontSizes: const [22, 22, 20, 18],
                  minFontSize: 18,
                  maxFontSize: 30,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 176, 171, 171)),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
              child: FutureImageWidget(
                imageUrl: widget.movie.posterPath,
                size: imageSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

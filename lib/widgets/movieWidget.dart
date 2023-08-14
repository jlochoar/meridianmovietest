import 'package:flutter/material.dart';
import 'package:movietest/logic/formater.dart';
import 'package:movietest/screens/movieDetailsScreen.dart';
import 'package:movietest/widgets/posterWidget.dart';
import '../models/movie.dart';

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
  void _navigateToMovieDetailScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: widget.movie)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToMovieDetailScreen(context);
      },
      child: Card(
        elevation: 20,
        color: const Color.fromARGB(255, 24, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 10, right: 10),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: PosterWidget(imageUrl: widget.movie.posterPath)),
            ),
            const Divider(),
            Text(
              widget.movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 176, 171, 171)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                Formatear.formatearTexto(widget.movie.overview),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

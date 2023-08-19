import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movietest/logic/random_color_generator.dart';
import 'package:movietest/models/genero.dart';
import '../screens/movie_list_screen.dart';

class GenreWidget extends StatelessWidget {
  final Genero genre;

  const GenreWidget({
    super.key,
    required this.genre,
  });

  void _navigateToMoviesListScreen(BuildContext context, Genero genre) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return MoviesListScreen(genre: genre);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToMoviesListScreen(context, genre);
      },
      child: Card(
        color: RandomColorGenerator.generateRandomColor(),
        child: Center(
          child: AutoSizeText(
            genre.name,
            overflow: TextOverflow.clip,
            maxLines: 2,
            textScaleFactor: 1.6,
            minFontSize: 2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

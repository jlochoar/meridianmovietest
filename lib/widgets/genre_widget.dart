import 'package:flutter/material.dart';
import 'package:movietest/logic/random_color_generator.dart';
import 'package:movietest/models/genero.dart';
import '../screens/movie_list_screen.dart';

class GenreWidget extends StatefulWidget {
  final Genero genre;
  const GenreWidget({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
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
        _navigateToMoviesListScreen(context, widget.genre);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            child: Card(
              color: RandomColorGenerator.generateRandomColor(),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  widget.genre.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

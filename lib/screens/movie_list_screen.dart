import 'package:flutter/material.dart';
import 'package:movietest/database/api.dart';
import 'package:movietest/drawer/renderizer.dart';
import 'package:movietest/models/genero.dart';
import 'package:movietest/models/movie.dart';
import 'package:movietest/widgets/autosIze_appbartext.dart';
import 'package:movietest/widgets/movie_widget.dart';

class MoviesListScreen extends StatefulWidget {
  final Genero genre;

  const MoviesListScreen({super.key, required this.genre});

  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  late PageController _pageController;

  @override
  void didChangeDependencies() {
    _pageController = PageController(
      viewportFraction: Renderizer.isDesktop(context) ? 0.2 : 0.9,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var cardWidth = Renderizer.getWidth(context);
    var cardHeight = Renderizer.getHeight(context) *
        (Renderizer.isDesktop(context) ? 0.95 : 0.72);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: AutoSizeAppBarText(
          text: widget.genre.name,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: FutureBuilder<List<Movie>>(
            future:
                ApiMovieTest.fetchMostPopularMoviesByGenreId(widget.genre.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final movies = snapshot.data!;
                return Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return MovieWidget(
                        movie: movies[index],
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text('No hay datos disponibles'));
              }
            },
          ),
        ),
      ),
    );
  }
}

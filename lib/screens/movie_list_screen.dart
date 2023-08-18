import 'package:flutter/material.dart';
import 'package:movietest/database/api.dart';
import 'package:movietest/models/genero.dart';
import 'package:movietest/models/movie.dart';
import 'package:movietest/widgets/movie_widget.dart';

class MoviesListScreen extends StatefulWidget {
  final Genero genre;

  const MoviesListScreen({super.key, required this.genre});

  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  late Future<List<Movie>> moviesFuturo;
  final PageController _pageController = PageController(
    viewportFraction: 0.9,
  );

  @override
  void initState() {
    super.initState();
    moviesFuturo =
        ApiMovieTest.fetchMostPopularMoviesByGenreId(widget.genre.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.genre.name),
      ),
      body: FutureBuilder<List<Movie>>(
        future: moviesFuturo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
    );
  }
}

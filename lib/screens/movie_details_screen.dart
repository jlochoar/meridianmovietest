import 'package:flutter/material.dart';
import 'package:movietest/drawer/renderizer.dart';
import 'package:movietest/models/movie.dart';
import 'package:movietest/widgets/future_image_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie _movie;

  const MovieDetailsScreen({super.key, required Movie movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        body: Renderizer.isDesktop(context)
            ? _landscape(context)
            : _portrait(context),
      ),
    );
  }

  Widget _landscape(BuildContext context) {
    final width = Renderizer.getWidth(context);
    return Row(
      children: [
        if (_movie.backdropPath != null)
          FutureImageWidget(
              imageUrl: _movie.backdropPath!,
              size: Size(width * 0.4, width * 0.4 * 3)),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _detailsList(),
            ),
          ),
        )
      ],
    );
  }

  Widget _portrait(BuildContext context) {
    final width = Renderizer.getWidth(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (_movie.backdropPath != null)
              FutureImageWidget(
                  imageUrl: _movie.backdropPath!,
                  size: Size(width, width * 3 / 4)),
            _detailsList(),
          ],
        ),
      ),
    );
  }

  Widget _detailsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _detailTile("Título", _movie.title),
        _detailTile("Reseña",
            _movie.overview.isNotEmpty ? _movie.overview : 'No disponible'),
        _detailTile("Puntuación", _movie.voteAverage.toString()),
        _detailTile("Contador de votos", _movie.voteCount.toString()),
        _detailTile("Popularidad", _movie.popularity.toString()),
        _detailTile("Fecha de lanzamiento", _movie.releaseDate),
        _detailTile("Idioma original ", _movie.originalLanguage),
        _detailTile("Título original", _movie.originalTitle),
      ],
    );
  }

  Widget _detailTile(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
              color: Color.fromARGB(255, 176, 171, 171),
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

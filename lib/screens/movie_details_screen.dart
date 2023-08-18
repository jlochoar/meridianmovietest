import 'package:flutter/material.dart';
import 'package:movietest/drawer/renderizer.dart';
import 'package:movietest/models/movie.dart';
import 'package:movietest/widgets/future_image_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Renderizer.isDesktop(context)
          ? landscape(context)
          : portrait(context),
    );
  }

  Widget landscape(BuildContext context) {
    return Row(
      children: [
        if (movie.backdropPath != null)
          FutureImageWidget(
              imageUrl: movie.backdropPath!,
              size: Size(MediaQuery.of(context).size.width * 0.4,
                  MediaQuery.of(context).size.width * 0.4 * 3)),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildDetailsList(),
            ),
          ),
        )
      ],
    );
  }

  Widget portrait(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (movie.backdropPath != null)
              FutureImageWidget(
                  imageUrl: movie.backdropPath!,
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.width * 3 / 4)),
            _buildDetailsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildDetailTile("Título", movie.title),
        _buildDetailTile("Reseña",
            movie.overview.isNotEmpty ? movie.overview : 'No disponible'),
        _buildDetailTile("Puntuación", movie.voteAverage.toString()),
        _buildDetailTile("Contador de votos", movie.voteCount.toString()),
        _buildDetailTile("Popularidad", movie.popularity.toString()),
        _buildDetailTile("Fecha de lanzamiento", movie.releaseDate),
        _buildDetailTile("Idioma original ", movie.originalLanguage),
        _buildDetailTile("Título original", movie.originalTitle),
      ],
    );
  }

  Widget _buildDetailTile(String label, String value) {
    return Card(
      color: const Color.fromARGB(255, 24, 24, 24),
      elevation: 2,
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

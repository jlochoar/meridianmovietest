import 'package:flutter/material.dart';
import 'package:movietest/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              _buildDetailsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildDetailTile("Title", movie.title),
        _buildDetailTile("Popularity", movie.popularity.toString()),
        _buildDetailTile("Overview", movie.overview),
        _buildDetailTile("Release Date", movie.releaseDate),
        _buildDetailTile("Original Language", movie.originalLanguage),
        _buildDetailTile("Original Title", movie.originalTitle),
        _buildDetailTile("Vote Average", movie.voteAverage.toString()),
        _buildDetailTile("Vote Count", movie.voteCount.toString()),
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

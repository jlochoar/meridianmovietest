import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/genero.dart';
import '../models/movie.dart';

class ApiMovieTest {
  static String apiKey = 'ff71409c15a2c0477adf874f4d71e748';
  static String imageBaseUrl = 'https://image.tmdb.org/t/p/';
  static String root = 'https://api.themoviedb.org/3/';
  static String imageFileSize = 'w500';
  static String settings = 'language=es&sort_by=popularity.desc';
  static Future<List<Genero>> fetchMovieGenres() async {
    final response = await http
        .get(Uri.parse('${root}genre/movie/list?api_key=$apiKey&$settings'));

    final genresList = jsonDecode(response.body)['genres'] as List<dynamic>;
    List<Genero> genres = genresList.map((genreMap) {
      return Genero.fromMap(genreMap);
    }).toList();
    genres.sort((a, b) => a.name.compareTo(b.name));
    return genres;
  }

  static Future<List<Movie>> fetchMostPopularMoviesByGenreId(int id) async {
    final response = await http.get(Uri.parse(
        '${root}discover/movie?with_genres=$id&$settings&api_key=$apiKey'));
    final results = jsonDecode(response.body)['results'] as List<dynamic>;
    List<Movie> movies =
        results.map((result) => Movie.fromMap(result)).toList();
    return movies;
  }

  static Future<http.Response> fetchImage(String imageUrl) async {
    return await http.get(Uri.parse(imageBaseUrl + imageFileSize + imageUrl));
  }
}

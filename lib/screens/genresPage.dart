import 'package:flutter/material.dart';
import 'package:movietest/database/api.dart';
import 'package:movietest/models/genero.dart';
import 'package:movietest/widgets/genreWidget.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  GenresPageState createState() => GenresPageState();
}

class GenresPageState extends State<GenresPage> {
  late Future<List<Genero>> generosFuture;

  @override
  void initState() {
    super.initState();
    generosFuture = ApiMovieTest.fetchMovieGenres();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Genero>>(
      future: generosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final generos = snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text('Géneros'),
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 160,
                crossAxisCount: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: generos.length,
              itemBuilder: (context, index) {
                return GenreWidget(genre: generos[index]);
              },
            ),
          );
        } else {
          return const Center(child: Text('No hay datos disponibles'));
        }
      },
    );
  }
}

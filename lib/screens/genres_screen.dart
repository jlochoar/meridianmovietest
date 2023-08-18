import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movietest/database/api.dart';
import 'package:movietest/models/genero.dart';
import 'package:movietest/screens/hidden_screen.dart';
import 'package:movietest/widgets/genre_widget.dart';
import 'package:movietest/drawer/renderizer.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  GenresScreenState createState() => GenresScreenState();
}

class GenresScreenState extends State<GenresScreen> {
  late Future<List<Genero>> genresFuture;

  @override
  void initState() {
    super.initState();
    genresFuture = ApiMovieTest.fetchMovieGenres();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late Timer _timer;

  void startTimer(BuildContext context) {
    _timer = Timer(const Duration(seconds: 1), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HiddenScreen()));
    });
  }

  void resetTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Genero>>(
        future: genresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final genres = snapshot.data!;
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: GestureDetector(
                    onLongPress: () {
                      startTimer(context);
                    },
                    onLongPressEnd: (_) {
                      resetTimer();
                    },
                    child: const Text('Géneros')),
              ),
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 160,
                  crossAxisCount: Renderizer.isDesktop(context) ? 2 : 1,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  return GenreWidget(genre: genres[index]);
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

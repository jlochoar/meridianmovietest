import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movietest/database/api.dart';
import 'package:movietest/models/genero.dart';
import 'package:movietest/screens/hidden_screen.dart';
import 'package:movietest/widgets/autosIze_appbartext.dart';
import 'package:movietest/widgets/genre_widget.dart';
import 'package:movietest/drawer/renderizer.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  GenresScreenState createState() => GenresScreenState();
}

class GenresScreenState extends State<GenresScreen> {
  @override
  Widget build(BuildContext context) {
    Timer? timer;
    return SafeArea(
      child: FutureBuilder<List<Genero>>(
        future: ApiMovieTest.fetchMovieGenres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final genres = snapshot.data!;
            return Scaffold(
                appBar: AppBar(
                  title: GestureDetector(
                      onLongPress: () {
                        timer = Timer(const Duration(seconds: 1), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HiddenScreen()));
                        });
                      },
                      onLongPressEnd: (_) {
                        if (timer!.isActive) {
                          timer!.cancel();
                        }
                      },
                      child: const AutoSizeAppBarText(text: 'Categorías')),
                ),
                body: Scrollbar(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: Renderizer.getHeight(context) / 5,
                      crossAxisCount: Renderizer.isDesktop(context) ? 2 : 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      return GenreWidget(genre: genres[index]);
                    },
                  ),
                ));
          } else {
            return const Center(child: Text('No hay datos disponibles'));
          }
        },
      ),
    );
  }
}

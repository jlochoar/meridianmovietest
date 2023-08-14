import 'package:flutter/material.dart';
import 'package:movietest/screens/genresPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: const CardTheme(color: Color.fromARGB(255, 24, 24, 24)),
          appBarTheme: const AppBarTheme(color: Colors.black),
          textTheme: const TextTheme(),
        ),
        home: const GenresPage(),
      );
}

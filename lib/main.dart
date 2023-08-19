import 'package:flutter/material.dart';
import 'package:movietest/drawer/renderizer.dart';
import 'package:movietest/screens/genres_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: CardTheme(color: Colors.grey.shade900),
          scaffoldBackgroundColor: Colors.black,
          scrollbarTheme: ScrollbarThemeData(
            trackVisibility: MaterialStateProperty.all<bool>(true),
            thumbColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
          ),
          appBarTheme: AppBarTheme(
              titleTextStyle: const TextStyle(
                color: Colors.white,
              ),
              elevation: 20,
              centerTitle: true,
              color: Colors.black,
              toolbarHeight: Renderizer.getHeight(context) * 0.1),
        ),
        home: const GenresScreen(),
      );
}

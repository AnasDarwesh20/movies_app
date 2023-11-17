import 'package:flutter/material.dart';
import 'package:movie/core/serveices/servecies_locator.dart';
import 'package:movie/core/style/theme.dart';
import 'package:movie/movies/presentation/screens/movies_screen.dart';

void main() {

  ServiceLocator().init() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Movies',
      theme: darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const MoviesScreen(),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:movie/core/utils/components.dart';
import 'package:movie/movies/presentation/screens/movies_screen.dart';

class AppIcons
{

  static  appBarActionIcons(context) => [
    IconButton(
      onPressed: ()
      {
        AppComponents.navigateTo(context: context , widget: const MoviesScreen()) ;
      },
      icon: const Icon(
        Icons.home ,
      ),
    ),
  ] ;



}
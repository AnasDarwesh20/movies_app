import 'package:flutter/material.dart';
import 'package:movie/core/style/app_colors.dart';
import 'package:movie/core/style/app_icons.dart';


ThemeData darkTheme() => ThemeData(
  scaffoldBackgroundColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
    color: AppColors.appBarColor ,
    actionsIconTheme: const IconThemeData(
      color: AppColors.appBarActionIconsColor ,
    ),
    elevation: 0.0 ,
  )  ,

  textTheme: const TextTheme(
    labelSmall: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.white ,
    ) ,
  ) ,
) ;
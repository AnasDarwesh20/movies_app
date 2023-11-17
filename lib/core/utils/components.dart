import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/style/app_colors.dart';
import 'package:movie/core/style/app_icons.dart';

class AppComponents {
  static void navigateTo({
    context,
    widget,
  }) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

  static defaultAppBar({
    required context,
    Color? backgroundColor,
    Text? title,
    double? titleSpacing,
  }) =>
      AppBar(
        actions: AppIcons.appBarActionIcons(context),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        title: title ?? const Text(''),
        titleSpacing: titleSpacing ?? 10.0,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 10 ,
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context)  ;
              },
            child: const Icon(
              Icons.arrow_back_ios ,
            ),
          ),
        ),
      );
}

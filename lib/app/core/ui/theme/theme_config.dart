import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: ColorsApp.i.greyDark, width: 1)
    );

  static final theme = ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyles.i.textPrimaryFontBold.copyWith(
            color: Colors.black,
            fontSize: 18
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(13),
          labelStyle: TextStyles.i.labelTextField,
          border: _defaultInputBorder,
          enabledBorder: _defaultInputBorder, 
          focusedBorder: _defaultInputBorder
        ),
        primaryColor: ColorsApp.i.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsApp.i.primary,
          primary: ColorsApp.i.primary,
          secondary: ColorsApp.i.secondary
          )
      );
}
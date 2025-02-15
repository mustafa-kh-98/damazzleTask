import 'package:damazsle/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../assets/fonts.gen.dart';
import 'extensions/action_button_theme_ex.dart';
import 'extensions/text_input_theme_ex.dart';

abstract class AppThemeData {
  ///[HERE IS THEME DARK DATA]///
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    extensions: [
      TextInputThemeEx.textInputLight,
      ActionButtonThemeEx.light,
    ],
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark.s100,
      ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.dark.s700,
        fontSize: 20,
        fontFamily: FontFamily.cairo,
      ),
      titleMedium: TextStyle(
        color: AppColors.dark.s600,
        fontSize: 16,
        fontFamily: FontFamily.cairo,
      ),
      titleSmall: TextStyle(
        color: AppColors.dark.s400,
        fontSize: 14,
        fontFamily: FontFamily.cairo,
      ),
    ),
    scaffoldBackgroundColor: AppColors.dark.s100,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.primary.main,
      cursorColor: AppColors.primary.main,
      selectionHandleColor: AppColors.primary.main,
    ),
    cardColor: AppColors.dark.s100,
    dividerTheme: DividerThemeData(
      color: AppColors.dark.s450,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.dark.s100,
      elevation: 2,
      selectedItemColor: AppColors.primary.main,
      unselectedItemColor: AppColors.dark.s500,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.primary.main,
        fontFamily: FontFamily.cairo,
      ),
      unselectedLabelStyle:  TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.dark.s500,
        fontFamily: FontFamily.cairo,
      ),
    )
  );

  ///[HERE IS THEME LIGHT DATA]///
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      extensions: [
        TextInputThemeEx.textInputDark,
        ActionButtonThemeEx.dark,

      ],
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark.s700,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.dark.s100,
          fontSize: 20,
          fontFamily: FontFamily.cairo,
        ),
        titleMedium: TextStyle(
          color: AppColors.dark.s200,
          fontSize: 16,
          fontFamily: FontFamily.cairo,
        ),
        titleSmall: TextStyle(
          color: AppColors.dark.s400,
          fontSize: 14,
          fontFamily: FontFamily.cairo,
        ),
      ),
      scaffoldBackgroundColor: AppColors.dark.s700,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.primary.main,
        cursorColor: AppColors.primary.main,
        selectionHandleColor: AppColors.primary.main,
      ),
      cardColor: Colors.black,
      dividerTheme: DividerThemeData(
        color: AppColors.dark.s450,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.dark.s700,
        elevation: 2,
        selectedItemColor: AppColors.primary.main,
        unselectedItemColor: AppColors.dark.s500,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.primary.main,
          fontFamily: FontFamily.cairo,
        ),
        unselectedLabelStyle:  TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.dark.s500,
          fontFamily: FontFamily.cairo,
        ),
      )
  );

}

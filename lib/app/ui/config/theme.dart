import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CCTheme {
  const CCTheme._();

  static const primaryColor = Color(0xFF54EAAA);
  static const scaffoldColor = Color(0xFF343434);
  static const backgroundColor = Color(0xFF3B3B3B);
  static const text1Color = Color(0xFFF1F1F1);
  static const text2Color = Color(0xFF3B3B3B);

  static const successColor = Color(0xFF009455);
  static const dangerColor = Color(0xFFf60040);
  static const warningColor = Color(0xFFffc800);

  static ThemeData instance = ThemeData(
    scaffoldBackgroundColor: scaffoldColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        color: primaryColor,
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: text2Color,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        foregroundColor: text2Color,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(48.0),
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          color: primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        foregroundColor: primaryColor,
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: text1Color,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        color: text1Color,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        color: text1Color,
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        color: primaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
      ),
    ),
  );
}
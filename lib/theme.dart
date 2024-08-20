import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(String companyName) {
    switch (companyName) {
      case 'Cambios Chaco':
        return ThemeData(
          primaryColor: const Color(0xFF004400), // Verde claro
          scaffoldBackgroundColor: const Color(0xFFCECECE), // Color de fondo
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 24,
              color: Color(0xFF004400), // Color para el texto principal
            ),
            labelLarge: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: Color(0xFFFFFFFF), // Color para el texto de los botones
            ),
            bodyLarge: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Color(0xFF004400),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white, // Fondo blanco para los campos de texto
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFF004400)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFF004400), width: 2.0),
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: const Color(0xFF004400), // Color para los botones
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFF27AE60), // Color de énfasis
          ),
        );
      default:
        return ThemeData.light(); // Tema por defecto si no coincide ninguna empresa
    }
  }
}

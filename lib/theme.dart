import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(String companyName) {
    switch (companyName) {
      case 'Cambios Chaco':
        return ThemeData(
          primaryColor: const Color(0xFF004400), // Verde oscuro de Cambios Chaco #004400
          hintColor: const Color(0xFF27AE60), // Verde claro de Cambios Chaco #27AE60
          scaffoldBackgroundColor: const Color(0xFFCECECE), // Color de fondo blanco
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF004400), // Color de la barra de navegación verde oscuro
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w500,
              fontSize: 35,
              color: Color(0xFF004400), // Color para el texto principal #004400
            ),
            titleMedium: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Color(0xFF004400), // Color para el texto principal #004400
            ),
            titleSmall: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w200,
              fontSize: 13,
              color: Color(0xFF004400), // Color para el texto principal #004400
            ),
            displayLarge: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 24,
              color: Color(0xFF004400), // Color para el texto principal #004400
            ),
            displayMedium: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Color(0xFF004400), // Color para el texto secundario #004400
            ),
            displaySmall: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Color(0xFF004400), // Color para el texto secundario #004400
            ),
            labelLarge: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w400,
              fontSize: 30,
              color: Color(0xFFFFFFFF), // Color para el texto de los botones (blanco)
            ),
            labelMedium: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: Color(0xFFFFFFFF), // Color para el texto de los botones (blanco)
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
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: Color(0xFF004400)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: Color(0xFF004400), width: 2.0),
            ),
            hintStyle: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 25,
              color: Color(0xFF939393), // Color para el hintText #939393
            ),
            labelStyle: TextStyle(
              fontFamily: 'HelveticaNeueLight',
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Color(0xFF939393), // Color para las etiquetas de los inputs
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFF004400), // Color del cursor
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF004400), // Color para los botones verde oscuro
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle: const TextStyle(
                fontFamily: 'HelveticaNeueBold',
                fontSize: 18,
                color: Colors.white,
              ),
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

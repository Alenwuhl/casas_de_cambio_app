import 'package:cambio_chaco_app/screens/payee_form_screen.dart';
import 'package:cambio_chaco_app/screens/inicial_menu_screen.dart';
import 'package:cambio_chaco_app/screens/login_screen.dart';
import 'package:cambio_chaco_app/screens/perfil_screen.dart';
import 'package:cambio_chaco_app/screens/reset_password.dart';
import 'package:cambio_chaco_app/screens/reset_pin.dart';
import 'package:cambio_chaco_app/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración definida para Cambios Chaco en el archivo theme.dart
    const companyName = "Cambios Chaco";

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(companyName),
      //Pantalla de inicio:
      home: const PayeeFormScreen(),
      supportedLocales: const [
        Locale('es', 'ES'), // Español
        Locale('en', 'US'), // Inglés
        Locale('pt', 'BR'), // Portugués
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // AppLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Controla la selección de idiomas según el dispositivo del usuario
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

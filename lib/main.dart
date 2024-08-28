import 'package:cambio_chaco_app/screens/exchange_screen.dart';
import 'package:cambio_chaco_app/widgets/operation_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cambio_chaco_app/screens/exchange_rates_screen.dart';
import 'package:cambio_chaco_app/screens/login_screen.dart';
import 'package:cambio_chaco_app/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importar dotenv

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('es', 'ES'); // Idioma por defecto

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Configuración definida para Cambios Chaco en el archivo theme.dart
    const companyName = "Cambios Chaco";

    return MaterialApp(
      title: 'Cambio Chaco App',
      theme: AppTheme.getTheme(companyName),
      home: const OperationSuccessWidget(),
      locale: _locale,
      supportedLocales: const [
        Locale('es', 'ES'), // Español
        Locale('en', 'US'), // Inglés
        Locale('pt', 'BR'), // Portugués
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
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

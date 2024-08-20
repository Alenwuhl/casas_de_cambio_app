import 'package:cambio_chaco_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuracion definida para cambio chaco en el archivo theme.dart
    const companyName = "Cambios Chaco";

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(companyName), 
      home: const LoginScreen(),
    );
  }
}


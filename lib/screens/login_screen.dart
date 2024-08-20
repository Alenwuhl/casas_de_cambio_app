import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/cambio_chaco_assets/Logo-login.png',
                height: 400,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                        
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            'assets/general_icons/icono-Usuario.png',
                            width: 20,
                            height: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Image.asset(
                            'assets/general_icons/icono-password.png',
                            width: 20,
                            height: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                      ),
                      child: Text(
                        'Ingresar',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).hintColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                      ),
                      child: Text(
                        'Registrarse',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Acción para registrar o recuperar contraseña
                      },
                      child: Text(
                        'Recuperar contraseña',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(), // Espacio para centrar la parte inferior
            ],
          ),
        ],
      ),
    );
  }
}

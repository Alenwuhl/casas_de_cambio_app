import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final topPadding = mediaQuery.padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: -topPadding, // Mueve la imagen hacia arriba eliminando el espacio del SafeArea
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/cambio_chaco_assets/Logo-login.png',
              height: screenHeight * 0.3,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.3), 
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.usernameLabel, 
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        child: Image.asset(
                          'assets/general_icons/icono-Usuario.png',
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.passwordLabel,
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w300,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        child: Image.asset(
                          'assets/general_icons/icono-password.png',
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.loginButton,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).hintColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.registerButton, 
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Acción para registrar o recuperar contraseña
                    },
                    child: Text(
                      AppLocalizations.of(context)!.recoverPasswordButton, 
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

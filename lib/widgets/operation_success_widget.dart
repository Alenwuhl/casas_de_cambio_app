import 'package:flutter/material.dart';
import 'package:cambio_chaco_app/screens/inicial_menu_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OperationSuccessWidget extends StatelessWidget {
  const OperationSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Dialog container
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03,
              horizontal: screenWidth * 0.05,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.operationSuccess,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Botón para volver al menú inicial
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const InicialMenuScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.005,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.exitButton,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Icono de éxito
        Positioned(
          top: screenHeight * 0.28,
          child: Image.asset(
            'assets/general_icons/icono-check.png',
            width: screenWidth * 0.4,
            height: screenHeight * 0.15,
          ),
        ),
      ],
    );
  }
}

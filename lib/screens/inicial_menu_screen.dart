import 'package:cambio_chaco_app/screens/exchange_rates_screen.dart';
import 'package:cambio_chaco_app/screens/exchange_screen.dart';
import 'package:cambio_chaco_app/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InicialMenuScreen extends StatelessWidget {
  const InicialMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cambio_chaco_assets/Logo-chico-transparente.png',
              fit: BoxFit.contain,
              height: screenHeight * 0.06,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: const MenuDrawer(),
      body: Center(
        child: Container(
          height: screenHeight * 0.7,
          width: screenWidth * 0.9,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(
                label: AppLocalizations.of(context)!.exchangeRates,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ExchangeRatesScreen(),
                    ),
                  );
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.03),
              MenuButton(
                label: AppLocalizations.of(context)!.currencyExchange,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ExchangeScreen(),
                    ),
                  );
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.03),
              MenuButton(
                label: AppLocalizations.of(context)!.transfers,
                onPressed: () {
                  // Acción para Transferencias
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.03),
              MenuButton(
                label: AppLocalizations.of(context)!.register,
                onPressed: () {
                  // Acción para Registrarse
                },
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.03),
              MenuButton(
                label: AppLocalizations.of(context)!.notifications,
                onPressed: () {
                  // Acción para Notificaciones
                },
                screenWidth: screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double screenWidth;

  const MenuButton({
    required this.label,
    required this.onPressed,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
        fixedSize: Size(screenWidth * 0.8, screenWidth * 0.15),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

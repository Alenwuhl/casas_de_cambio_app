import 'package:cambio_chaco_app/data/countries.dart';
import 'package:cambio_chaco_app/screens/inicial_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayeeFormScreen extends StatefulWidget {
  const PayeeFormScreen({super.key});

  @override
  _PayeeFormScreen createState() => _PayeeFormScreen();
}

class _PayeeFormScreen extends State<PayeeFormScreen> {
  String? selectedCountry;
  String? selectedDocumentType;
  final List<String> countries = Countries.countryList;

  final List<String> documentTypes = ['Cédula', 'Pasaporte'];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final horizontalPadding = screenWidth * 0.08;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/general_icons/Icono-Inicio.png',
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InicialMenuScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        title: Center(
          child: Image.asset(
            'assets/cambio_chaco_assets/Logo-chico-transparente.png',
            fit: BoxFit.contain,
            height: screenHeight * 0.06,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          bottom: screenHeight * 0.04,
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text(
                AppLocalizations.of(context)!.profileTitle, 
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: screenHeight * 0.06),
              TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.fullNamePlaceholder, 
                  labelStyle: Theme.of(context).textTheme.displayLarge,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.fullNamePlaceholder, 
                  labelStyle: Theme.of(context).textTheme.displayLarge,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              DropdownButtonFormField<String>(
                value: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.cameraOption, 
                  labelStyle: Theme.of(context).textTheme.displayLarge,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
                items: countries
                    .map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        ))
                    .toList(),
              ),
              SizedBox(height: screenHeight * 0.02),
              DropdownButtonFormField<String>(
                value: selectedDocumentType,
                onChanged: (value) {
                  setState(() {
                    selectedDocumentType = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.cameraOption,
                  labelStyle: Theme.of(context).textTheme.displayLarge,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
                items: documentTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.cameraOption, 
                  labelStyle: Theme.of(context).textTheme.displayLarge,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.cameraOption, 
                  labelStyle: Theme.of(context).textTheme.displayLarge,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              ElevatedButton(
                onPressed: () {
                  // Acción al presionar el botón
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.confirmButton, 
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

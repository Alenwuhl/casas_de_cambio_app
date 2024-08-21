import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final horizontalPadding = screenWidth * 0.08;
    final topPadding = mediaQuery.padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: -topPadding,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/cambio_chaco_assets/Logo-login.png',
              height: screenHeight * 0.3,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.25),
              Text(
                AppLocalizations.of(context)!.changePasswordTitle, 
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: screenHeight * 0.055),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: TextField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        hintText: AppLocalizations.of(context)!.currentPasswordHint, 
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Image.asset(
                            'assets/general_icons/icono-password.png',
                            width: screenWidth * 0.06,
                            height: screenWidth * 0.06,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: TextField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        hintText: AppLocalizations.of(context)!.newPasswordHint, 
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Image.asset(
                            'assets/general_icons/icono-password.png',
                            width: screenWidth * 0.06,
                            height: screenWidth * 0.06,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: TextField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                        hintText: AppLocalizations.of(context)!.confirmPasswordHint, 
                        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Image.asset(
                            'assets/general_icons/icono-password.png',
                            width: screenWidth * 0.06,
                            height: screenWidth * 0.06,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.confirmButton, 
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ],
      ),
    );
  }
}

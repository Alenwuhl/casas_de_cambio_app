import 'package:flutter/material.dart';

class ResetPin extends StatelessWidget {
  const ResetPin({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final horizontalPadding = screenWidth * 0.08;
    final topPadding = mediaQuery.padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
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
              SizedBox(height: screenHeight * 0.3),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Cambio de PIN',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: screenHeight * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: TextField(
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                    hintText: 'Contraseña',
                    hintStyle: const TextStyle(
                      fontFamily: 'HelveticaNeueLight',
                      fontSize: 25,
                      color: Color(0xFF939393),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Image.asset(
                        'assets/general_icons/icono-password.png',
                        width: screenWidth * 0.06,
                        height: screenWidth * 0.06,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01), 
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  'Ingresar la contraseña para cambiar el PIN',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.12),
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
                      'Confirmar',
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

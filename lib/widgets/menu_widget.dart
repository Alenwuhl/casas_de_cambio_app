import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.2,
            child: Image.asset(
              'assets/cambio_chaco_assets/Logo-login.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Cotizaciones.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.quotes, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Cotizaciones
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Cambio.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.changes, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Cambios
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Envio-de-Giro.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.sendTransfer, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Envío de Giro
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Recibir-Giro.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.receiveTransfer, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Recibir Giro
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Consulta-de-Giro.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.transferQuery, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Consulta de Giro
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Notificaciones.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.notifications, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Notificaciones
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-Sucursales.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.branches, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Sucursales
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-perfil.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.profile, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Perfil
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-acerca-de.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.about, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Acerca de
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                ListTile(
                  leading: Image.asset(
                    'assets/general_icons/menu_drawer/Icono-cerrar-sesion.png',
                    width: screenWidth * 0.07,
                    height: screenWidth * 0.07,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.logout, 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: screenWidth * 0.045),
                  ),
                  onTap: () {
                    // Acción para Cerrar Sesión
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cambio_chaco_app/screens/cotizaciones_screen.dart';

class CotizacionesWidget extends StatelessWidget {
  final Future<List<Cotizacion>> cotizaciones;
  final List<Cotizacion> cotizacionesList;
  final List<Cotizacion> filteredCotizaciones;
  final String searchQuery;

  const CotizacionesWidget({
    required this.cotizaciones,
    required this.cotizacionesList,
    required this.filteredCotizaciones,
    required this.searchQuery,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return FutureBuilder<List<Cotizacion>>(
      future: cotizaciones,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              '${AppLocalizations.of(context)!.errorLoadingRates}: ${snapshot.error}',
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(AppLocalizations.of(context)!.noRatesAvailable),
          );
        }

        List<Cotizacion> filteredData = searchQuery.isNotEmpty
            ? cotizacionesList.where((cotizacion) {
                return cotizacion.monNom.toLowerCase().contains(searchQuery);
              }).toList()
            : cotizacionesList;

        return SingleChildScrollView(
          child: Column(
            children: filteredData.map((cotizacion) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/flags_iso/128/${cotizacion.monBPaId.toLowerCase()}.png',
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.08,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.flag, size: screenWidth * 0.1);
                        },
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: formatMonNom(cotizacion.monNom, context),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .buyLabel
                                    .toUpperCase(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                formatNumber(cotizacion.cotCom),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'HelveticaNeueLight',
                                  color: Color(0xFF565656),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .sellLabel
                                    .toUpperCase(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                formatNumber(cotizacion.cotVen),
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'HelveticaNeueLight',
                                  color: Color(0xFF565656),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (cotizacion != filteredData.last)
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: screenHeight * 0.02,
                    ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget formatMonNom(String monNom, BuildContext context) {
    final words = monNom.split(' '); // Dividimos el texto en palabras
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: words.map((word) => TextSpan(text: '$word\n')).toList(),
      ),
      textAlign: TextAlign.left,
    );
  }

  String formatNumber(String number) {
    final num parsed = num.parse(number);
    return parsed.toStringAsFixed(3);
  }
}

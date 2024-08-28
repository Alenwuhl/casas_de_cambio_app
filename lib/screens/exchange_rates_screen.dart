import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cambio_chaco_app/services/get_cotizaciones_service.dart';
import 'package:cambio_chaco_app/widgets/cotizaciones_widget.dart';

class ExchangeRatesScreen extends StatefulWidget {
  const ExchangeRatesScreen({super.key});

  @override
  _ExchangeRatesScreenState createState() => _ExchangeRatesScreenState();
}

class _ExchangeRatesScreenState extends State<ExchangeRatesScreen> {
  late Future<List<Cotizacion>> cotizaciones;
  List<Cotizacion> cotizacionesList = [];
  List<Cotizacion> filteredCotizaciones = [];
  String searchQuery = "";
  bool isSearchVisible = false;

  final GetCotizacionesService _cotizacionesService = GetCotizacionesService();

@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    cotizaciones = _cotizacionesService.fetchCotizaciones(context);
    setState(() {});
  });
}


  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredCotizaciones = cotizacionesList.where((cotizacion) {
        return cotizacion.monNom.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.05,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: FutureBuilder<List<Cotizacion>>(
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

              cotizacionesList = snapshot.data!;

              filteredCotizaciones = searchQuery.isNotEmpty
                  ? cotizacionesList.where((cotizacion) {
                      return cotizacion.monNom
                          .toLowerCase()
                          .contains(searchQuery);
                    }).toList()
                  : cotizacionesList;

              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            AppLocalizations.of(context)!.exchangeRates,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            isSearchVisible = !isSearchVisible;
                          });
                        },
                      ),
                    ],
                  ),
                  if (isSearchVisible)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: TextField(
                        onChanged: updateSearchQuery,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.searchLabel,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  Expanded(
                    child: CotizacionesWidget(
                      cotizaciones: cotizaciones,
                      cotizacionesList: cotizacionesList,
                      filteredCotizaciones: filteredCotizaciones,
                      searchQuery: searchQuery,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Cotizacion {
  final String cotCom;
  final String cotVen;
  final String monNom;
  final String monBPaId;

  Cotizacion({
    required this.cotCom,
    required this.cotVen,
    required this.monNom,
    required this.monBPaId,
  });

  factory Cotizacion.fromJson(Map<String, dynamic> json) {
    return Cotizacion(
      cotCom: json['CotCom'],
      cotVen: json['CotVen'],
      monNom: json['MonNom'],
      monBPaId: json['MonBPaId'],
    );
  }
}

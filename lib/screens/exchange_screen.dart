import 'package:cambio_chaco_app/screens/cotizaciones_screen.dart';
import 'package:cambio_chaco_app/services/get_cotizaciones_service.dart';
import 'package:cambio_chaco_app/widgets/currency_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cambio_chaco_app/widgets/menu_widget.dart';
import 'package:cambio_chaco_app/widgets/currency_dropdown_widget.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  String? selectedCurrency;
  String? selectedPaymentCurrency;
  double inputAmount = 0.0;
  double conversionResult = 0.0;
  double conversionRate = 1.0;
  late Future<List<Cotizacion>> cotizaciones;
  List<Cotizacion> cotizacionesList = [];
  final GetCotizacionesService _cotizacionesService = GetCotizacionesService();

  @override
  void initState() {
    super.initState();
    cotizaciones = _cotizacionesService.fetchCotizaciones();
  }

  void calculateConversion() {
    if (selectedCurrency != null && selectedPaymentCurrency != null) {
      final selectedCotizacion = cotizacionesList.firstWhere((cot) => cot.monNom == selectedCurrency);
      final paymentCotizacion = cotizacionesList.firstWhere((cot) => cot.monNom == selectedPaymentCurrency);

      setState(() {
        conversionRate = double.parse(selectedCotizacion.cotCom) / double.parse(paymentCotizacion.cotVen);
        conversionResult = inputAmount * conversionRate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          padding: EdgeInsets.all(screenWidth * 0.1),
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

              // Creación de la lista de monedas con su bandera
              final currencies = cotizacionesList.map((cot) {
                return {
                  'name': cot.monNom,
                  'flagCode': cot.monBPaId.toLowerCase(),
                };
              }).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.exchangeTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // ¿Qué moneda desea?
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.whatCurrency,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CurrencyDropdown(
                    selectedCurrency: selectedCurrency,
                    currencies: currencies,
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value;
                        calculateConversion();
                      });
                    },
                    exampleCurrency: "DOLARES AMERICANOS",
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Monto a ingresar
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.enterAmount,
                      labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                      border: Theme.of(context).inputDecorationTheme.border,
                      focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                    ),
                    onChanged: (value) {
                      setState(() {
                        inputAmount = double.tryParse(value) ?? 0.0;
                        calculateConversion();
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Cotización
                  if (selectedCurrency != null)
                    Text(
                      '${AppLocalizations.of(context)!.currentRate}: $conversionRate',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  SizedBox(height: screenHeight * 0.02),
                  // ¿Cómo desea pagar?
                  Text(
                    AppLocalizations.of(context)!.howToPay,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CurrencyDropdown(
                    selectedCurrency: selectedPaymentCurrency,
                    currencies: currencies,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentCurrency = value;
                        calculateConversion();
                      });
                    },
                    exampleCurrency: "PESOS URUGUAYOS",
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Monto a pagar
                  if (selectedPaymentCurrency != null)
                    Text(
                      '${AppLocalizations.of(context)!.amountToPay}: $conversionResult',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  SizedBox(height: screenHeight * 0.04),
                  // Disponibilidad
                  Text(
                    AppLocalizations.of(context)!.availability,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Text(
                    'Guaraníes 3.696.200',
                    style: TextStyle(
                      fontFamily: 'HelveticaNeueLight',
                      color: Color(0xFF004400),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Nota de límite de operación
                  Text(
                    '*${AppLocalizations.of(context)!.operationLimit}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Botón Siguiente
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                          vertical: screenHeight * 0.005,
                        ),
                        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                      ),
                      child: Text(AppLocalizations.of(context)!.nextButton),
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

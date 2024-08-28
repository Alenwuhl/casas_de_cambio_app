import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import '../screens/exchange_rates_screen.dart';

class GetCotizacionesService {
  Future<List<Cotizacion>> fetchCotizaciones(BuildContext context) async {
    final ioc = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    final httpClient = IOClient(ioc);

    final url = dotenv.env['COTIZACIONES_URL'];
    if (url == null) {
      throw Exception(AppLocalizations.of(context)!.urlNotDefined);
    }

    final response = await httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse =
          json.decode(response.body)['SdtCotizacionesWS'];
      return jsonResponse.map((data) => Cotizacion.fromJson(data)).toList();
    } else {
      throw Exception(AppLocalizations.of(context)!.errorLoadingRates);
    }
  }
}

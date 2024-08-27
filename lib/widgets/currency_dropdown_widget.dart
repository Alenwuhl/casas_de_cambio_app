import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String? selectedCurrency;
  final List<Map<String, String>> currencies;
  final ValueChanged<String?> onChanged;
  final String exampleCurrency; // La moneda de ejemplo que aparecerá por defecto

  const CurrencyDropdown({
    super.key,
    required this.selectedCurrency,
    required this.currencies,
    required this.onChanged,
    required this.exampleCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCurrency ?? exampleCurrency,
      hint: Text(
        exampleCurrency,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      items: currencies.map((currency) {
        return DropdownMenuItem<String>(
          value: currency['name'],
          child: Row(
            children: [
              Image.asset(
                'assets/flags_iso/64/${currency['flagCode']}.png',
                width: 32,
                height: 32,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
              ),
              const SizedBox(width: 8),
              Text(
                currency['name']!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

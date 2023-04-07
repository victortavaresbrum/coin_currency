import 'package:cubos_moedas/app/data/currency.dart';
import 'package:cubos_moedas/app/ui/widgets/currency_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../editor/editor_model.dart';

class EditorBaseSelectState extends StatelessWidget {
  const EditorBaseSelectState({super.key, required this.onSelected});

  final ValueChanged<Currency> onSelected;

  @override
  Widget build(BuildContext context) {
    EditorModel model = context.watch();
    return ListView.builder(
        itemCount: Currency.values.length,
        itemBuilder: (context, index) {
          final currency = Currency.values[index];

          return CurrencyTile(
            title: currency.name,
            onClicked: () => onSelected(currency),
            selected: model.base == currency,
          );
        });
  }
}

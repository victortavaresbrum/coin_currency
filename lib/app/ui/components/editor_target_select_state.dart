import 'package:cubos_moedas/app/ui/widgets/currency_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/currency.dart';
import '../editor/editor_model.dart';

class EditorTargetsSelectState extends StatelessWidget {
  const EditorTargetsSelectState({super.key, required this.onSelect});

  final ValueChanged<Currency> onSelect;

  @override
  Widget build(BuildContext context) {
    EditorModel model = context.watch();
    final currencies =
        Currency.values.where((data) => model.base != data).toList();

    return ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          return CurrencyTile(
            title: currency.name,
            onClicked: () => onSelect(currency),
            selected: model.existsTarget(currency),
          );
        });
  }
}

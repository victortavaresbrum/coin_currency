import 'package:cubos_moedas/app/data/exchange.dart';
import 'package:flutter/material.dart';

import '../widgets/currency_tile.dart';

class HomeExchangesState extends StatelessWidget {
  const HomeExchangesState({super.key, required this.exchanges});
  final List<Exchange> exchanges;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
        itemCount: exchanges.length,
        itemBuilder: (context, index) {
          final exchange = exchanges[index];
          return CurrencyTile(
            title: exchange.target.name,
            value: exchange.bid,

          );
          
        });
  }
}

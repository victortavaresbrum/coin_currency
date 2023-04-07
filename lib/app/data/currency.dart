import 'package:cubos_moedas/app/data/failures.dart';

enum Currency {
  brl(abbr: 'BRL', name: 'Real'),
  gbp(abbr: 'GBP', name: 'Libra Esterlina'),
  usd(abbr: 'USD', name: 'Dólar'),
  ars(abbr: 'ARS',name: 'Peso Argentino'),
  jpy(abbr: 'JPY',name: 'Yene');

  const Currency({required this.abbr, required this.name});

  final String abbr;
  final String name;

  static Currency parse(String v){
   for(final c in Currency.values){
    if(c.abbr == v ) {
      return c;
    }
   }
   throw NotExistsCurrency('Moeda não definida!');
  }

}

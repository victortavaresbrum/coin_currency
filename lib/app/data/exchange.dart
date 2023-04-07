// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'currency.dart';

class Exchange {
  final Currency base;
  final Currency target;
  final double bid;
  late DateTime _date;

  Exchange(
      {DateTime? date,
      required this.base,
      required this.target,
      required this.bid}) {
        
    _date = date ?? DateTime.now();
  }

  DateTime get date => _date;

  @override
  String toString() => 'Exchange(base: $base, target: $target, bid: $bid, date: $_date)';
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'currency.dart';

class ExchangesRequest {
  final Currency base;
  final List<Currency> targets;

  ExchangesRequest({required this.base, required this.targets});

  @override
  String toString() => 'ExchangesRequest(base: $base, targets: $targets)';
}

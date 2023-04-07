import 'package:cubos_moedas/app/data/currency.dart';
import 'package:flutter/material.dart';

class EditorModel extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  Currency? _base;
  Currency? get base => _base;
  set base(Currency? currency) {
    _base = currency;
    notifyListeners();
  }

  List<Currency> _targets = [];
  List<Currency> get targets => [..._targets];
  set targets(List<Currency> currencies) {
    _targets = [...currencies];
    notifyListeners();
  }

  bool existsTarget(Currency currency) {
    return targets.indexWhere((element) => element == currency) >= 0;
  }
}

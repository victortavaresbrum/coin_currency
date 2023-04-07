import 'package:cubos_moedas/app/ui/editor/editor_model.dart';
import 'package:flutter/material.dart';

import '../../data/currency.dart';
import '../../data/exchanges_request.dart';

class EditorController {
  final EditorModel _model;

  final PageController pageController = PageController();

  EditorController({required EditorModel model}) : _model = model;

  void onPageChange(int index) {
    _model.pageIndex = index;
  }

  void onSelectedBase(Currency currency) async {
    _model.base = currency;
    await Future.delayed(Duration(milliseconds: 150));
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void onSelectTarget(Currency currency) {
    if (_model.existsTarget(currency)) {
      _model.targets = _model.targets.where((e) => e != currency).toList();
    } else {
      _model.targets = [..._model.targets, currency];
    }
  }

  void onSubmit(BuildContext context){
        final request = ExchangesRequest(
      base: _model.base!,
      targets: _model.targets,
    );
    Navigator.pop(context, request);
  }
    void close(BuildContext context) {
    Navigator.pop(context);
  }
}

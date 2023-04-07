import 'package:cubos_moedas/app/data/exchange.dart';
import 'package:cubos_moedas/app/data/exchange_repository.dart';
import 'package:cubos_moedas/app/data/exchanges_request.dart';
import 'package:cubos_moedas/app/ui/home/home_initial_state.dart';
import 'package:cubos_moedas/app/ui/home/routes.dart';
import 'package:cubos_moedas/app/ui/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/currency.dart';
import 'home_exchanges_state.dart';
import 'home_loading_state.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final ExchangeRepository _repository;
  AsyncSnapshot<List<Exchange>> _snapshot = const AsyncSnapshot.nothing();

  void _loadExchanges() async {
    await Navigator.pushNamed(context,Routes.editor);

    setState(() {
      _snapshot = const AsyncSnapshot.waiting();
    });

    final result = await _repository.get(ExchangesRequest(
        base: Currency.brl, targets: [Currency.usd, Currency.ars]));

    setState(() {
      _snapshot = AsyncSnapshot.withData(ConnectionState.done, result);
    });
  }

  @override
  void initState() {
    super.initState();
    _repository = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubos Currency'),
        actions: [
          if (_snapshot.hasData)
            IconButton(
              onPressed: _loadExchanges,
              icon: const Icon(
                Icons.compare_arrows,
                color: CCTheme.primaryColor,
                size: 32,
              ),
            ),
        ],
      ),
      body: Builder(builder: (context) {
        if (_snapshot.connectionState == ConnectionState.none) {
          return HomeInitialState(onStartClicked: _loadExchanges);
        }
        ;
        if (_snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoadingState();
        }
        return HomeExchangesState(
          exchanges: _snapshot.data!,
        );
      }),
    );
  }
}

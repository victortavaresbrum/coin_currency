import 'package:cubos_moedas/app/ui/home/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/exchange_repository.dart';
import 'ui/config/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ExchangeRepository(),
      child: MaterialApp(
        title: 'Cubos Currency',
        debugShowCheckedModeBanner: false,
        theme: CCTheme.instance,
        initialRoute: Routes.home,
        routes: Routes.routes,
      ),
    );
  }
}

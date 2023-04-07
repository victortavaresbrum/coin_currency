import 'package:cubos_moedas/app/ui/components/home/home_initial_state.dart';
import 'package:flutter/material.dart';

import 'home_loading_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubos Currency'),
        
      ),
      body: const HomeLoadingState(),
    );
  }
}
import 'package:flutter/material.dart';

class HomeInitialState extends StatelessWidget {
  const HomeInitialState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Acompanhamento de moedas não definido',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Iniciar'))
          ],
        ),
      ),
    );
  }
}

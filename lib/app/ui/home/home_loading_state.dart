import 'package:cubos_moedas/app/ui/components/snake_progress_indicator.dart';
import 'package:flutter/material.dart';


class HomeLoadingState extends StatelessWidget {
  const HomeLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const  [
          SnakeProgressIndicator(),
          SizedBox(height: 8,),
          Text('Definindo moedas',textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
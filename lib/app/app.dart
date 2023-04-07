import 'package:flutter/material.dart';

import 'ui/components/home/home_view.dart';
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cubos Currency',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
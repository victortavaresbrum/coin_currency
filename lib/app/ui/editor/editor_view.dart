import 'package:cubos_moedas/app/ui/components/editor_scaffold.dart';
import 'package:cubos_moedas/app/ui/editor/editor_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editor_controller.dart';

class EditorView extends StatelessWidget {
  const EditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EditorModel()),
        Provider(create: (context) => EditorController(model: context.read()))
      ],
      child: EditorScaffold(),
    );
  }
}
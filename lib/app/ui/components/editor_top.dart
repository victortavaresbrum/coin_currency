import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../editor/editor_model.dart';

class EditorTop extends StatelessWidget implements PreferredSizeWidget {
  const EditorTop({super.key});

  @override
  Widget build(BuildContext context) {
    EditorModel model = context.watch();
    final theme = Theme.of(context);

    Widget? subtitle;
    if (model.base == null) {
      subtitle = const Text('Selecione uma moeda base para as conversões');
    } else {
      subtitle = Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Selecione as moedas a serem cotadas em ',
            ),
            TextSpan(
              text: model.base?.name,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        style: theme.textTheme.bodyMedium,
      );
    }
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Novo Acompanhamento',
              style: theme.appBarTheme.titleTextStyle,
            ),
            const SizedBox(height: 20.0),
            subtitle,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
import 'package:cubos_moedas/app/ui/components/editor_indicator.dart';
import 'package:cubos_moedas/app/ui/editor/editor_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditorBottomNav extends StatelessWidget {
  const EditorBottomNav({super.key, required this.onSubmit});

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    EditorModel model = context.watch();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          EditorIndicator(actived: model.pageIndex ==0),
          const SizedBox(width: 8,),
          EditorIndicator(actived: model.pageIndex ==1),
          const Spacer(),
          if(model.base != null)
          ElevatedButton(onPressed: model.targets.isNotEmpty ? onSubmit : null, child: Text('Concluir'))
        ],
      ),
    );
  }
}

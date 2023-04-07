import 'package:cubos_moedas/app/ui/config/theme.dart';
import 'package:cubos_moedas/app/ui/editor/editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../editor/editor_model.dart';
import '../home/routes.dart';
import 'editor_base_select_state.dart';
import 'editor_bottom_nav.dart';
import 'editor_target_select_state.dart';
import 'editor_top.dart';

class EditorScaffold extends StatelessWidget {
  const EditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    EditorController controller = context.read();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              controller.close(context);
            },
            icon: Icon(
              Icons.close,
              color: CCTheme.primaryColor,
            )),
        bottom: EditorTop(),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onPageChange,
        children: [
          EditorBaseSelectState(
            onSelected: controller.onSelectedBase,
          ),
          EditorTargetsSelectState(
            onSelect: controller.onSelectTarget,
          ),
        ],
      ),
      bottomNavigationBar: EditorBottomNav(
        onSubmit: () {
          controller.onSubmit(context);
        },
      ),
    );
  }
}

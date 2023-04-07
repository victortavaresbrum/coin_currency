import 'package:cubos_moedas/app/ui/home/home_view.dart';
import 'package:flutter/material.dart';

import '../editor/editor_view.dart';

class Routes {
  const Routes._();

  static const home = '/home';
  static const editor = '/editor';
  static const history = '/history';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeView(),
    editor: (context)=> const EditorView(),
  };
}

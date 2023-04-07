import 'package:flutter/material.dart';

import '../config/theme.dart';

class EditorIndicator extends StatelessWidget {
  const EditorIndicator({super.key, required this.actived});

  final bool actived;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: actived?  CCTheme.primaryColor : CCTheme.backgroundColor,
    );
  }
}
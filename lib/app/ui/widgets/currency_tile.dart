import 'package:cubos_moedas/app/ui/config/theme.dart';
import 'package:flutter/material.dart';

import '../../data/exchange_status.dart';

class CurrencyTile extends StatefulWidget {
  const CurrencyTile({
    super.key,
    this.onClicked,
    this.selected = false,
    required this.title,
    this.icon = Icons.attach_money,
    this.value,
  });

  final VoidCallback? onClicked;
  final bool selected;

  final String title;
  final double? value;
  final IconData icon;

  @override
  State<CurrencyTile> createState() => _CurrencyTileState();
}

class _CurrencyTileState extends State<CurrencyTile> {
  Color get _statusColor {
    switch (ExchangesStatus.fromValue(widget.value ?? 0)) {
      case ExchangesStatus.low:
        return CCTheme.successColor;
      case ExchangesStatus.medium:
        return CCTheme.warningColor;
      case ExchangesStatus.high:
        return CCTheme.dangerColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: widget.onClicked,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
            color: CCTheme.backgroundColor,
            border: widget.selected
                ? Border.all(
                    color: CCTheme.primaryColor,
                  )
                : Border.all(
                    color: CCTheme.backgroundColor,
                  ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 30,
                color: widget.selected //
                    ? CCTheme.primaryColor
                    : CCTheme.text1Color,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: widget.selected //
                      ? CCTheme.primaryColor
                      : null,
                ),
              ),
              const Spacer(),
              if (widget.value != null)
                Text(
                  '${widget.value}',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: _statusColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';

class SnakeProgressIndicator extends StatefulWidget {
  const SnakeProgressIndicator({
    super.key,
    this.valueColor = const Color(0xFF54EAAA),
    this.backgroundColor = const Color(0xFF4D4D4D),
    this.value,
  });

  final Color valueColor;
  final Color backgroundColor;
  final double? value;

  @override
  State<SnakeProgressIndicator> createState() => _SnakeProgressIndicatorState();
}

class _SnakeProgressIndicatorState extends State<SnakeProgressIndicator> {
  static const _countProgress = 11;

  int _value = 0;
  bool _animated = true;
  Timer? _timer;

  bool get isLastPosition => _value == _countProgress - 1;

  bool get isPrevLastPosition => _value == _countProgress - 2;

  bool get isFirstPosition => _value == 0;

  bool get isSecondPosition => _value == 1;

  @override
  void initState() {
    super.initState();
    if (widget.value == null) {
      _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
        if (_value == _countProgress - 1) {
          setState(() => _value = 0);
        } else {
          setState(() => _value++);
        }
      });
    } else {
      _animated = false;
      _value = (widget.value! * _countProgress).round();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final next = isLastPosition ? 0 : _value + 1;
    final next2 = isPrevLastPosition
        ? 0
        : isLastPosition
            ? 1
            : _value + 2;
    final prev = isFirstPosition ? _countProgress - 1 : _value - 1;
    final prev2 = isSecondPosition
        ? _countProgress - 1
        : isFirstPosition
            ? _countProgress - 2
            : _value - 1;
    return Row(
      children: List.generate(_countProgress, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 20.0,
          width: 20.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          decoration: BoxDecoration(
            color: index == _value
                ? widget.valueColor
                : (index == next && _animated) || index == prev
                    ? widget.valueColor.withOpacity(0.6)
                    : (index == next2 && _animated) || index == prev2
                        ? widget.valueColor.withOpacity(0.3)
                        : widget.backgroundColor,
          ),
        );
      }),
    );
  }
}

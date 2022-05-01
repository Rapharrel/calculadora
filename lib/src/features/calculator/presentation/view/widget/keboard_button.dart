import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final Widget child;
  final bool filled;
  final void Function()? onPressed;

  const KeyboardButton({
    Key? key,
    required this.child,
    this.filled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return filled
        ? ElevatedButton(
            onPressed: onPressed,
            child: child,
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: child,
          );
  }
}

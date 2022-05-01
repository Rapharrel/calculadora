import 'package:calculadora/src/features/calculator/presentation/view/widget/keboard_button.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class RPNKeyboard extends StatelessWidget {
  final void Function(String text)? onKeyPressed;

  const RPNKeyboard({
    Key? key,
    this.onKeyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createLine1(),
        createLine2(),
        createLine3(),
        createLine4(),
        createLine5(),
      ],
    );
  }

  createLine1() {
    return Row(
      children: [
        createButton("7"),
        createButton("8"),
        createButton("9"),
        createButton("/"),
        createButton("^"),
      ],
    );
  }

  createLine2() {
    return Row(
      children: [
        createButton("4"),
        createButton("5"),
        createButton("6"),
        createButton("x"),
        createButton("AND"),
      ],
    );
  }

  createLine3() {
    return Row(
      children: [
        createButton("1"),
        createButton("2"),
        createButton("3"),
        createButton("-"),
        createButton("OR"),
      ],
    );
  }

  createLine4() {
    return Row(
      children: [
        createButton("decimal_separator".i18n()),
        createButton("0"),
        createButton("00"),
        createButton("+"),
        createButton("XOR"),
      ],
    );
  }

  createLine5() {
    return Row(
      children: [
        createButton("©"),
        createButton("backspace", icon: const Icon(Icons.backspace)),
        createButton("space_bar", icon: const Icon(Icons.space_bar)),
        createButton("="),
      ],
    );
  }

  KeyboardButton createButton(String text, {Icon? icon}) {
    return KeyboardButton(
      child: icon ?? Text(text),
      onPressed: () => onKeyPressed != null ? onKeyPressed!(text) : null,
    );
  }
}

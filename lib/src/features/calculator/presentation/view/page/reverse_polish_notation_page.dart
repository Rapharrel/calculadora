import 'package:calculadora/src/features/calculator/presentation/viewmodel/reverse_polish_notation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class ReversePolishNotationPage extends StatefulWidget {
  const ReversePolishNotationPage({Key? key}) : super(key: key);

  @override
  State<ReversePolishNotationPage> createState() =>
      _ReversePolishNotationPageState();
}

class _ReversePolishNotationPageState extends ModularState<
    ReversePolishNotationPage, ReversePolishNotationViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reverse_polish_notation'.i18n()),
      ),
    );
  }
}

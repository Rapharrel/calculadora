import 'dart:math';

import 'package:localization/localization.dart';

class ReversePolishNotationUseCase {
  List<String> operators = ["+"];

  bool isNotDigitOrDecimalSeparator(String key) {
    return key != "0" &&
        key != "00" &&
        key != "1" &&
        key != "2" &&
        key != "3" &&
        key != "4" &&
        key != "5" &&
        key != "6" &&
        key != "7" &&
        key != "8" &&
        key != "9" &&
        key != ".";
  }

  String calculate(String display) {
    List<String> itens = display.split(" ");
    List<double> pilha = [];

    int i = 0;
    while (true) {
      if (pilha.isEmpty) {
        double? number = double.tryParse(itens[i]);
        if (number == null) {
          return "error".i18n();
        } else {
          pilha.add(number);
        }
      } else {
        double? number = double.tryParse(itens[i]);
        if (number != null) {
          pilha.add(number);
        } else {
          if (pilha.length < 2) {
            return "error".i18n();
          }
          if (itens[i] == "+") {
            double item1 = pilha.removeLast();
            double item2 = pilha.removeLast();
            double result = item2 + item1;
            pilha.add(result);
          }
          if (itens[i] == "-") {
            double item1 = pilha.removeLast();
            double item2 = pilha.removeLast();
            double result = item2 - item1;
            pilha.add(result);
          }
          if (itens[i] == "/") {
            double item1 = pilha.removeLast();
            double item2 = pilha.removeLast();
            double result = item2 / item1;
            pilha.add(result);
          }
          if (itens[i] == "x") {
            double item1 = pilha.removeLast();
            double item2 = pilha.removeLast();
            double result = item2 * item1;
            pilha.add(result);
          }
          if (itens[i] == "^") {
            double item1 = pilha.removeLast();
            double item2 = pilha.removeLast();
            double result = pow(item2, item1) as double;
            pilha.add(result);
          }
        }
      }
    }

    return "error".i18n();
  }

  String insertKey(String display, String key) {
    if (display[display.length - 1] == " ") {
      if (key == " ") {
        return display;
      }
    } else {
      if (isNotDigitOrDecimalSeparator(key)) {
        display += " ";
      } else if (display == "0") {
        if (key != ".") {
          display = "";
        }
      }
    }
    return display += key;
  }
}

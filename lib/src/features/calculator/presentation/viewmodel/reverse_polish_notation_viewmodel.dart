import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/reverse_polish_notation_usecase.dart';

part 'reverse_polish_notation_viewmodel.g.dart';

class ReversePolishNotationViewModel = _ReversePolishNotationViewModelBase
    with _$ReversePolishNotationViewModel;

abstract class _ReversePolishNotationViewModelBase with Store {
  final _usecase = Modular.get<ReversePolishNotationUseCase>();

  @observable
  String display = "0";

  @observable
  List<String> results = [];

  @action
  addKeyValue(String key) {
    if (key == "backspace") {
      if (display.isNotEmpty) {
        display = display.substring(0, display.length - 1);
      }
    } else {
      if (key == "space") {
        key = " ";
      }
      if (display == "=") {
        String displayFormat =
            display.replaceAll("decimal_separator".i18n(), ".");
        String result = _usecase.calculate(displayFormat);
        result = result.replaceAll(".", "decimal_separator".i18n());
        results.insert(results.length - 1, display + " " + result);
        display = "0";
      } else {
        String displayFormat =
            display.replaceAll("decimal_separator".i18n(), ".");
        key = key.replaceAll(".", "decimal_separator".i18n());
        displayFormat = _usecase.insertKey(displayFormat, key);
        display = displayFormat.replaceAll(".", "decimal_separator".i18n());
      }
    }
  }
}

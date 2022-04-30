import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/reverse_polish_notation_usecase.dart';

part 'reverse_polish_notation_viewmodel.g.dart';

class ReversePolishNotationViewModel = _ReversePolishNotationViewModelBase
    with _$ReversePolishNotationViewModel;

abstract class _ReversePolishNotationViewModelBase with Store {
  final _usecase = Modular.get<ReversePolishNotationUseCase>();
}

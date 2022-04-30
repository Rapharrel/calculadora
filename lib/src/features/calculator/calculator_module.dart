import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecase/reverse_polish_notation_usecase.dart';
import 'presentation/view/page/reverse_polish_notation_page.dart';
import 'presentation/viewmodel/reverse_polish_notation_viewmodel.dart';

class CalculatorModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ReversePolishNotationViewModel()),
        Bind.factory((i) => ReversePolishNotationUseCase()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ReversePolishNotationPage()),
      ];
}

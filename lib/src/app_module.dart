import 'package:calculadora/src/features/calculator/calculator_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/calculator/calculator_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: CalculatorModule()),
      ];
}

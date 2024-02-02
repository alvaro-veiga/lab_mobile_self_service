
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_core/lab_core.dart';
import 'package:lab_self_service/src/core/env.dart';

// Essa Binding é responsável por prover o RestClient para a aplicação
class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
      Bind.lazySingleton<RestClient>((i) => RestClient(Env.backendBaseUrl)),
    ];
  }
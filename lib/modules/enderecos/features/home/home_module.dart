import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const HomePage()),
  ];
}

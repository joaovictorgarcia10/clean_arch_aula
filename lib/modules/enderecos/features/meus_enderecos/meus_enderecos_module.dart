import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/detalhes_endereco/detalhes_endereco_page.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/informar_numeracao/informar_numeracao_page.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/meus_enderecos/meus_enderecos_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MeusEnderecosModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const MeusEnderecosPage()),
    ChildRoute(
      "/detalhes",
      child: (context, args) => DetalhesEnderecoPage(endereco: args.data),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 800),
    ),
    ChildRoute(
      "/informar_numeracao",
      child: (context, args) => InformarNumeracaoPage(
        endereco: args.data["endereco"],
        latitude: args.data["latitude"],
        longitude: args.data["longitude"],
      ),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    )
  ];
}

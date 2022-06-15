import 'package:clean_arch_aula/modules/auth/auth_module.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/home_module.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/meus_enderecos_module.dart';
import 'package:clean_arch_aula/shared/features/geolocation/data/services/geolocation_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:clean_arch_aula/shared/features/geolocation/data/repositories/geolocation_repository_impl.dart';
import 'shared/features/geolocation/domain/usecase/get_geolocation.dart';
import 'shared/features/session/domain/entities/session.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Session()),

    // Geolocation
    Bind((i) => GeolocationServiceImpl()),
    Bind((i) => GeolocationRepositoryImpl(i<GeolocationServiceImpl>())),
    Bind((i) => GetGeolocation(i<GeolocationRepositoryImpl>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/", module: AuthModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute(
      "/meus_enderecos",
      module: MeusEnderecosModule(),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 300),
    ),
  ];
}
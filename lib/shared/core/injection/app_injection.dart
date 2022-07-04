import 'package:clean_arch_aula/modules/auth/auth_injection.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/home_injection.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/meus_enderecos_injection.dart';
import 'package:clean_arch_aula/shared/core/session/session.dart';
import 'package:clean_arch_aula/shared/features/geolocation/data/repositories/geolocation_repository_impl.dart';
import 'package:clean_arch_aula/shared/features/geolocation/data/services/geolocation_service_impl.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/usecase/get_geolocation.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class AppInjection {
  Future<void> init() async {
    // Session
    sl.registerSingleton(() => Session());

    // Geolocation
    sl.registerFactory((() => GeolocationServiceImpl()));
    sl.registerFactory(
        (() => GeolocationRepositoryImpl(sl<GeolocationServiceImpl>())));
    sl.registerFactory((() => GetGeolocation(sl<GeolocationRepositoryImpl>())));

    // Modules Dependencies
    await AuthInjection().init();
    await HomeInjection().init();
    await MeusEnderecosInjection().init();
  }
}

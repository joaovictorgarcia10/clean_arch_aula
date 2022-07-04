import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:clean_arch_aula/shared/core/services/http_service/dio_http_service_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/home_datasource_impl.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/usecases/buscar_endreco.dart';
import 'domain/usecases/disconnect_account.dart';
import 'domain/usecases/save_endereco.dart';

class HomeInjection {
  final sl = GetIt.instance;

  Future<void> init() async {
    // Datasources
    sl.registerLazySingleton(() => HomeDatasourceImpl(
          httpService: DioHttpServiceImpl(),
          firebaseFirestore: FirebaseFirestore.instance,
          firebaseAuth: FirebaseAuth.instance,
        ));

    //Repository
    sl.registerLazySingleton(
        () => HomeRepositoryImpl(sl<HomeDatasourceImpl>()));

    // UseCases
    sl.registerLazySingleton(() => BuscarEndreco(sl<HomeRepositoryImpl>()));
    sl.registerLazySingleton(() => SaveEndereco(sl<HomeRepositoryImpl>()));
    sl.registerLazySingleton(() => DisconnectAccount(sl<HomeRepositoryImpl>()));

    // Bloc
    sl.registerFactory(
      () => HomeBloc(
        sl<BuscarEndreco>(),
        sl<SaveEndereco>(),
        sl<DisconnectAccount>(),
      ),
    );
  }
}

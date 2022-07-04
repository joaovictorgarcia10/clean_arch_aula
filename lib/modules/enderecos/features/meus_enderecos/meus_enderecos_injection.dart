import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/detalhes_endereco/bloc/detalhes_endereco_bloc.dart';
import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/presentation/pages/meus_enderecos/bloc/meus_enderecos_bloc.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/usecase/get_geolocation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/meus_enderecos_datasource_impl.dart';
import 'data/repositories/meus_enderecos_repository_impl.dart';
import 'domain/usecases/delete_endereco.dart';
import 'domain/usecases/get_lista_enderecos.dart';

class MeusEnderecosInjection {
  final sl = GetIt.instance;

  Future<void> init() async {
    // Datasources
    sl.registerLazySingleton(() => MeusEnderecosDatasourceImpl(
          firebaseFirestore: FirebaseFirestore.instance,
        ));

    //Repository
    sl.registerLazySingleton(
        () => MeusEnderecosRepositoryImpl(sl<MeusEnderecosDatasourceImpl>()));

    // UseCases
    sl.registerLazySingleton(
        () => GetListaEnderecos(sl<MeusEnderecosRepositoryImpl>()));
    sl.registerLazySingleton(
        () => DeleteEndereco(sl<MeusEnderecosRepositoryImpl>()));

    // Bloc
    sl.registerFactory(() => MeusEnderecosBloc(sl<GetListaEnderecos>()));
    sl.registerFactory(
      () => DetalhesEnderecoBloc(
        sl<DeleteEndereco>(),
        sl<GetGeolocation>(),
      ),
    );
  }
}

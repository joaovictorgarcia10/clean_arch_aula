import 'package:clean_arch_aula/modules/enderecos/features/home/data/repositories/home_repository_impl.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/buscar_endreco.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/disconnect_account.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/domain/usecases/save_endereco.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:clean_arch_aula/modules/enderecos/features/home/presentation/pages/home_page/home_page.dart';
import 'package:clean_arch_aula/shared/core/services/dio_service/custom_dio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data/datasources/home_datasource_impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources
    Bind(
      (i) => HomeDatasourceImpl(
        dio: CustomDio(),
        firebaseFirestore: FirebaseFirestore.instance,
        firebaseAuth: FirebaseAuth.instance,
      ),
    ),
    //Repository
    Bind((i) => HomeRepositoryImpl(i<HomeDatasourceImpl>())),
    // UseCases
    Bind((i) => BuscarEndreco(i<HomeRepositoryImpl>())),
    Bind((i) => SaveEndereco(i<HomeRepositoryImpl>())),
    Bind((i) => DisconnectAccount(i<HomeRepositoryImpl>())),

    // Blocs
    Bind(
      (i) => HomeBloc(
        i<BuscarEndreco>(),
        i<SaveEndereco>(),
        i<DisconnectAccount>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const HomePage()),
  ];
}

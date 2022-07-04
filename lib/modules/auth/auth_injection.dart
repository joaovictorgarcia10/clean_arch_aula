import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/auth_datasource_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/create_account.dart';
import 'domain/usecases/do_login.dart';
import 'domain/usecases/reset_password.dart';

final sl = GetIt.instance;

class AuthInjection {
  Future<void> init() async {
    // Datasources
    sl.registerLazySingleton(
        () => AuthDatasourceImpl(firebaseAuth: FirebaseAuth.instance));

    //Repository
    sl.registerLazySingleton(
        () => AuthRepositoryImpl(datasource: sl<AuthDatasourceImpl>()));

    // UseCases
    sl.registerLazySingleton(
        () => DoLogin(repository: sl<AuthRepositoryImpl>()));
    sl.registerLazySingleton(
        () => CreateAccount(repository: sl<AuthRepositoryImpl>()));
    sl.registerLazySingleton(
        () => ResetPassword(repository: sl<AuthRepositoryImpl>()));

    // Bloc
    sl.registerFactory(() => LoginBloc(sl<DoLogin>()));
    sl.registerFactory(() => CadastroBloc(sl<CreateAccount>()));
    sl.registerFactory(() => EsqueciSenhaBloc(sl<ResetPassword>()));
  }
}

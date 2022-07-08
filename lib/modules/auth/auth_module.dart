import 'package:clean_arch_aula/modules/auth/data/datasources/auth_datasource_impl.dart';
import 'package:clean_arch_aula/modules/auth/domain/usecases/create_account.dart';
import 'package:clean_arch_aula/modules/auth/domain/usecases/reset_password.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/cadastro_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/esqueci_senha_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/login_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/splash/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/do_login.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasources
    Bind((i) => AuthDatasourceImpl(firebaseAuth: FirebaseAuth.instance)),
    //Repository
    Bind((i) => AuthRepositoryImpl(datasource: i<AuthDatasourceImpl>())),
    // UseCases
    Bind((i) => DoLogin(repository: i<AuthRepositoryImpl>())),
    Bind((i) => CreateAccount(repository: i<AuthRepositoryImpl>())),
    Bind((i) => ResetPassword(repository: i<AuthRepositoryImpl>())),

    // Bloc
    Bind((i) => LoginBloc(i<DoLogin>())),
    Bind((i) => CadastroBloc(i<CreateAccount>())),
    Bind((i) => EsqueciSenhaBloc(i<ResetPassword>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => const SplashPage(),
    ),
    ChildRoute(
      "/login",
      child: (context, args) => const LoginPage(),
      transition: TransitionType.size,
      duration: const Duration(milliseconds: 1200),
    ),
    ChildRoute(
      "/cadastro",
      child: (context, args) => const CadastroPage(),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 800),
    ),
    ChildRoute(
      "/esqueci_senha",
      child: (context, args) => const EsqueciSenhaPage(),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 800),
    ),
  ];
}

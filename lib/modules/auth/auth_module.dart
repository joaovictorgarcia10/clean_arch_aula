import 'package:clean_arch_aula/modules/auth/domain/usecases/create_account.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/cadastro_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/bloc/login_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/login_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/splash/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'data/datasources/auth_datasource.dart';
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
    // Bloc
    Bind((i) => LoginBloc(i<DoLogin>())),
    Bind((i) => CadastroBloc(i<CreateAccount>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => const SplashPage()),
    ChildRoute("/login", child: (context, args) => const LoginPage()),
    ChildRoute(
      "/cadastro",
      child: (context, args) => const CadastroPage(),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 800),
    ),
  ];
}

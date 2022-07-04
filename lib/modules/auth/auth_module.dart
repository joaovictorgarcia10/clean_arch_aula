import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/cadastro_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/esqueci_senha_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/login/login_page.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
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

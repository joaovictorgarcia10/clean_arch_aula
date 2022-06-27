import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/modules/auth/domain/usecases/create_account.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/cadastro/bloc/cadastro_state.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late CadastroBloc cadastroBloc;
  late CreateAccount createAccount;
  late AuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    createAccount = CreateAccount(repository: authRepository);
    cadastroBloc = CadastroBloc(createAccount);
  });

  group("CadastroBloc", () {
    test("CadastroBloc - success", () {
      when(() => authRepository.createAccount(
            email: "email",
            password: "password",
          )).thenAnswer((_) async => const Right(true));

      cadastroBloc.add(CadastroEvent.createAccount(
          params: CreateAccountParams(
        email: "email",
        password: "password",
      )));

      expectLater(
        cadastroBloc.stream,
        emitsInOrder(
          const [
            CadastroState.loading(),
            CadastroState.success(),
          ],
        ),
      );
    });

    test("CadastroBloc - failure", () {
      final failure = Failure();

      when(() => authRepository.createAccount(
            email: "email",
            password: "password",
          )).thenAnswer((_) async => Left(failure));

      cadastroBloc.add(CadastroEvent.createAccount(
          params: CreateAccountParams(
        email: "email",
        password: "password",
      )));

      expectLater(
        cadastroBloc.stream,
        emitsInOrder(
          [
            const CadastroState.loading(),
            CadastroState.failure(failure: failure),
          ],
        ),
      );
    });
  });
}

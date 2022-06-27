import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/modules/auth/domain/usecases/reset_password.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_bloc.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_event.dart';
import 'package:clean_arch_aula/modules/auth/presentation/pages/esqueci_senha/bloc/esqueci_senha_state.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late EsqueciSenhaBloc esqueciSenhaBloc;
  late ResetPassword resetPassword;
  late AuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    resetPassword = ResetPassword(repository: authRepository);
    esqueciSenhaBloc = EsqueciSenhaBloc(resetPassword);
  });

  group("EsqueciSenhaBloc", () {
    test("EsqueciSenhaBloc - success", () {
      when(() => authRepository.resetPassword(email: "email"))
          .thenAnswer((_) async => const Right(true));
      esqueciSenhaBloc
          .add(const EsqueciSenhaEvent.resetPassword(email: "email"));
      expectLater(
        esqueciSenhaBloc.stream,
        emitsInOrder(
          const [
            EsqueciSenhaState.loading(),
            EsqueciSenhaState.success(),
          ],
        ),
      );
    });

    test("EsqueciSenhaBloc - failure", () {
      final failure = Failure();
      when(() => authRepository.resetPassword(email: "email"))
          .thenAnswer((_) async => Left(failure));
      esqueciSenhaBloc
          .add(const EsqueciSenhaEvent.resetPassword(email: "email"));
      expectLater(
        esqueciSenhaBloc.stream,
        emitsInOrder(
          [
            const EsqueciSenhaState.loading(),
            EsqueciSenhaState.failure(failure: failure),
          ],
        ),
      );
    });
  });
}

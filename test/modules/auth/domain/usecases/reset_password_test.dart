import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/modules/auth/domain/usecases/reset_password.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthRepository authRepository;
  late ResetPassword resetPassword;

  setUp(() {
    authRepository = MockAuthRepository();
    resetPassword = ResetPassword(repository: authRepository);
  });

  group("ResetPassword", () {
    test("ResetPassword - Success", () async {
      when(() => authRepository.resetPassword(email: "email"))
          .thenAnswer((_) async => const Right(true));
      final result = await resetPassword("email");
      result.fold((l) => null, (r) => expect(r, true));
    });

    test("ResetPassword - Failure", () async {
      final failure = Failure();
      when(() => authRepository.resetPassword(email: "email"))
          .thenAnswer((_) async => Left(failure));
      final result = await resetPassword("email");
      result.fold((l) => expect(l, failure), (r) => null);
    });
  });
}

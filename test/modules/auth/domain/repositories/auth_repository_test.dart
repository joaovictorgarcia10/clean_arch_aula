import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group("AuthRepository - DoLogin", () {
    test("DoLogin - Success", () async {
      final user = UserModel();
      when(() => authRepository.doLogin(email: "email", password: "password"))
          .thenAnswer((_) async => Right(user));
      final response =
          await authRepository.doLogin(email: "email", password: "password");
      response.fold((l) => null, (r) => expect(r, user));
    });

    test("DoLogin - Failure", () async {
      final failure = Failure();
      when(() => authRepository.doLogin(email: "email", password: "password"))
          .thenAnswer((_) async => Left(failure));
      final response =
          await authRepository.doLogin(email: "email", password: "password");
      response.fold((l) => expect(l, failure), (r) => null);
    });
  });

  group("AuthRepository - CreateAccount", () {
    test("CreateAccount - Success", () async {
      when(() => authRepository.createAccount(
          email: "email",
          password: "password")).thenAnswer((_) async => const Right(true));
      final response = await authRepository.createAccount(
          email: "email", password: "password");
      response.fold((l) => null, (r) => expect(r, true));
    });

    test("CreateAccount - Failure", () async {
      final failure = Failure();
      when(() => authRepository.createAccount(
          email: "email",
          password: "password")).thenAnswer((_) async => Left(failure));
      final response = await authRepository.createAccount(
          email: "email", password: "password");
      response.fold((l) => expect(l, failure), (r) => null);
    });
  });

  group("AuthRepository - ResetPassword", () {
    test("ResetPassword - Success", () async {
      when(() => authRepository.resetPassword(email: "email"))
          .thenAnswer((_) async => const Right(true));
      final response = await authRepository.resetPassword(email: "email");
      response.fold((l) => null, (r) => expect(r, true));
    });

    test("ResetPassword - Failure", () async {
      final failure = Failure();
      when(() => authRepository.resetPassword(email: "email"))
          .thenAnswer((_) async => Left(failure));
      final response = await authRepository.resetPassword(email: "email");
      response.fold((l) => expect(l, failure), (r) => null);
    });
  });
}

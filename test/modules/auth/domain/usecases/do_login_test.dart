import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/modules/auth/domain/usecases/do_login.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late DoLogin doLogin;
  late AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    doLogin = DoLogin(repository: repository);
  });

  group("DoLogin", () {
    test("DoLogin - Success", () async {
      final user = UserModel();
      when(() => repository.doLogin(email: "email", password: "password"))
          .thenAnswer((_) async => Right(user));
      final response =
          await doLogin(DoLoginParams(email: "email", password: "password"));
      response.fold((l) => null, (r) => expect(r, user));
    });

    test("DoLogin - Failure", () async {
      final failure = Failure();
      when(() => repository.doLogin(email: "email", password: "password"))
          .thenAnswer((_) async => Left(failure));
      final response =
          await doLogin(DoLoginParams(email: "email", password: "password"));
      response.fold((l) => expect(l, failure), (r) => null);
    });
  });
}

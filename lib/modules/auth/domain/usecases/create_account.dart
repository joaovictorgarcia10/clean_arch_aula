import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class CreateAccount extends UsecaseCore<bool, CreateAccountParams> {
  final AuthRepository repository;
  CreateAccount({required this.repository});

  @override
  Future<Either<Failure, bool>> call(CreateAccountParams params) async {
    return await repository.createAccount(
      email: params.email,
      password: params.password,
    );
  }
}

class CreateAccountParams {
  final String email;
  final String password;

  CreateAccountParams({
    required this.email,
    required this.password,
  });
}

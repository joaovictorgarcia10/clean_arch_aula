import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';
import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class DoLogin extends UsecaseCore<User, DoLoginParams> {
  final AuthRepository repository;
  DoLogin({required this.repository});

  @override
  Future<Either<Failure, User>> call(DoLoginParams params) async {
    final result = await repository.doLogin(
        email: params.email, password: params.password);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

class DoLoginParams {
  final String email;
  final String password;

  DoLoginParams({
    required this.email,
    required this.password,
  });
}

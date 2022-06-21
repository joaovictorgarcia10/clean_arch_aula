import 'package:clean_arch_aula/modules/auth/data/datasources/auth_datasource.dart';
import 'package:clean_arch_aula/modules/auth/domain/entities/user.dart';
import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, User>> doLogin(
      {required String email, required String password}) async {
    final result = datasource.doLogin(email: email, password: password);
    return result;
  }

  @override
  Future<Either<Failure, bool>> createAccount(
      {required String email, required String password}) {
    final result = datasource.createAccount(email: email, password: password);
    return result;
  }

  @override
  Future<Either<Failure, bool>> resetPassword({required String email}) {
    final result = datasource.resetPassword(email: email);
    return result;
  }
}

import 'package:clean_arch_aula/modules/auth/data/datasources/auth_datasource.dart';
import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;
  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserModel>> doLogin(
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
}

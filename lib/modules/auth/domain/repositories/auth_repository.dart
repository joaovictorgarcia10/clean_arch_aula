import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/modules/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> doLogin(
      {required String email, required String password});

  Future<Either<Failure, bool>> createAccount(
      {required String email, required String password});
}

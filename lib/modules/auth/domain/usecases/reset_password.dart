import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/modules/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';

class ResetPassword extends UsecaseCore<bool, String> {
  final AuthRepository repository;
  ResetPassword({required this.repository});

  @override
  Future<Either<Failure, bool>> call(String params) async {
    final result = await repository.resetPassword(email: params);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

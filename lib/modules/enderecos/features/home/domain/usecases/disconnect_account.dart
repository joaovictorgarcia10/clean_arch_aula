import 'package:clean_arch_aula/modules/enderecos/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';

class DisconnectAccount implements UsecaseCore<bool, NoParams> {
  final HomeRepository _repository;
  DisconnectAccount(this._repository);

  @override
  Future<Either<Failure, bool>> call([NoParams? params]) async {
    final result = await _repository.disconnet();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

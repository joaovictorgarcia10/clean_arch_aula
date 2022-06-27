import 'package:clean_arch_aula/modules/enderecos/features/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class SaveEndereco implements UsecaseCore<bool, Endereco> {
  final HomeRepository _homeRepository;
  SaveEndereco(this._homeRepository);

  @override
  Future<Either<Failure, bool>> call(Endereco endereco) async {
    return await _homeRepository.saveEndereco(endereco: endereco);
  }
}

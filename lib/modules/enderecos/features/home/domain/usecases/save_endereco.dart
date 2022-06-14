import 'package:clean_arch_aula/modules/enderecos/features/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:dartz/dartz.dart';

class SaveEndereco implements UsecaseCore<bool, EnderecoModel> {
  final HomeRepository _homeRepository;
  SaveEndereco(this._homeRepository);

  @override
  Future<Either<Failure, bool>> call(EnderecoModel endereco) async {
    final result = await _homeRepository.saveEndereco(endereco: endereco);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

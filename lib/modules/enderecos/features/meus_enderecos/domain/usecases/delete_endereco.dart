import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class DeleteEndereco implements UsecaseCore<bool, DeleteEnderecoParams> {
  final MeusEnderecosRepository _meusEnderecosRepository;
  DeleteEndereco(this._meusEnderecosRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteEnderecoParams params) async {
    return await _meusEnderecosRepository.deleteEndereco(idEndereco: params.id);
  }
}

class DeleteEnderecoParams {
  final String id;
  DeleteEnderecoParams({
    required this.id,
  });
}

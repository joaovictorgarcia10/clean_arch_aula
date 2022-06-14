import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class DeleteEndereco implements UsecaseCore<bool, DeleteEnderecoParams> {
  final MeusEnderecosRepository _meusEnderecosRepository;
  DeleteEndereco(this._meusEnderecosRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteEnderecoParams params) async {
    final result =
        await _meusEnderecosRepository.deleteEndereco(idEndereco: params.id);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

class DeleteEnderecoParams {
  final String id;
  DeleteEnderecoParams({
    required this.id,
  });
}

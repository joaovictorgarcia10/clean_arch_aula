import 'package:clean_arch_aula/modules/enderecos/features/meus_enderecos/domain/repositories/meus_enderecos_repository.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:dartz/dartz.dart';

class GetListaEnderecos implements UsecaseCore<List<EnderecoModel>, NoParams> {
  final MeusEnderecosRepository _meusEnderecosRepository;
  GetListaEnderecos(this._meusEnderecosRepository);

  @override
  Future<Either<Failure, List<EnderecoModel>>> call([NoParams? params]) async {
    final result = await _meusEnderecosRepository.getListaEnderecos();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

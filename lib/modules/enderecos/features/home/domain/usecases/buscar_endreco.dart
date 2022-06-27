import 'package:clean_arch_aula/modules/enderecos/features/home/domain/repositories/home_repository.dart';
import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class BuscarEndreco implements UsecaseCore<Endereco, BuscarEndrecoParams> {
  final HomeRepository _enderecoRepository;
  BuscarEndreco(this._enderecoRepository);

  @override
  Future<Either<Failure, Endereco>> call(BuscarEndrecoParams params) async {
    return await _enderecoRepository.buscarEndereco(cep: params.cep);
  }
}

class BuscarEndrecoParams {
  final String cep;
  BuscarEndrecoParams({
    required this.cep,
  });
}

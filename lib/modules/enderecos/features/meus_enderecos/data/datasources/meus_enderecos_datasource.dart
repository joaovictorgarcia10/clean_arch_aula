import 'package:clean_arch_aula/modules/enderecos/shared/models/endereco_model.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MeusEnderecosDatasource {
  Future<Either<Failure, List<EnderecoModel>>> getListaEnderecos();
  Future<Either<Failure, bool>> deleteEndereco({required String idEndereco});
}

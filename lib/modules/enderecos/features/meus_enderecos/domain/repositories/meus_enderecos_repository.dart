import 'package:clean_arch_aula/modules/enderecos/shared/entities/endereco.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MeusEnderecosRepository {
  Future<Either<Failure, List<Endereco>>> getListaEnderecos();
  Future<Either<Failure, bool>> deleteEndereco({required String idEndereco});
}

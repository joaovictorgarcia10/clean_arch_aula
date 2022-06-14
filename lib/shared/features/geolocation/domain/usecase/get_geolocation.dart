import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/entities/geolocation.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/repositories/geolocation_repository.dart';
import 'package:clean_arch_aula/shared/core/usecase/usecase_core.dart';
import 'package:dartz/dartz.dart';

class GetGeolocation implements UsecaseCore<Geolocation, NoParams> {
  final GeolocationRepository _geolocationRepository;
  GetGeolocation(this._geolocationRepository);

  @override
  Future<Either<Failure, Geolocation>> call([NoParams? params]) async {
    final result = await _geolocationRepository.getGeolocation();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}

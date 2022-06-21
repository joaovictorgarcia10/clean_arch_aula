import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/entities/geolocation.dart';
import 'package:dartz/dartz.dart';

abstract class GeolocationService {
  Future<Either<Failure, Geolocation>> getGeolocation();
}

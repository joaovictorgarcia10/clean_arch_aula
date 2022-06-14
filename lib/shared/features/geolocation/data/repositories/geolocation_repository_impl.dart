import 'package:clean_arch_aula/shared/features/geolocation/data/services/geolocation_service.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/entities/geolocation.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/repositories/geolocation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  final GeolocationService _geoLocationService;
  GeolocationRepositoryImpl(this._geoLocationService);

  @override
  Future<Either<Failure, Geolocation>> getGeolocation() async {
    final result = await _geoLocationService.getGeolocation();
    return result;
  }
}

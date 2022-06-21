import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:clean_arch_aula/shared/features/geolocation/data/services/geolocation_service.dart';
import 'package:clean_arch_aula/shared/features/geolocation/domain/entities/geolocation.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceImpl implements GeolocationService {
  @override
  Future<Either<Failure, Geolocation>> getGeolocation() async {
    try {
      LocationPermission permission;
      bool actived = await Geolocator.isLocationServiceEnabled();

      if (!actived) {
        throw GeolocationNotActiveFailure().message;
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        throw GeolocationPermissionDeniedFailure().message;
      }

      if (permission == LocationPermission.deniedForever) {
        throw GeolocationPermissionDeniedFailure().message;
      }

      final currentPosition = await Geolocator.getCurrentPosition();

      Geolocation geolocation = Geolocation(
          latitude: currentPosition.latitude,
          longitude: currentPosition.longitude);

      return Right(geolocation);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

part of 'package:task/core/di/app_di.dart';

final domainModulesDi = GetIt.instance;

void _domainModulesInit() {
  domainModulesDi.registerLazySingleton(
    () => OpenWeather(domainModulesDi()),
  );

  domainModulesDi.registerLazySingleton(
    () => Geolocation(),
  );
}

part of 'package:task/core/di/app_di.dart';

final dataModulesDi = GetIt.instance;

void _dataModulesInit() async {
  // Register dio module
  dataModulesDi.registerLazySingleton(() {
    final dioClient = DioClient();

    dioClient.addInterceptors([
      QueriesInterceptor(),
      CurlLoggerDioInterceptor(printOnSuccess: true),
    ]);
    dioClient.addBadCertificateCallBack();
    return dioClient.getDio();
  });

  // Api
  dataModulesDi.registerLazySingleton(
    () => Api(
      dataModulesDi(),
      baseUrl: 'https://api.openweathermap.org/data/2.5',
    ),
  );

  //datasources
  dataModulesDi.registerLazySingleton<RemoteDataSourceContract>(
    () => RemoteDataSource(
      api: dataModulesDi(),
    ),
  );
}

part of 'package:task/core/di/app_di.dart';

final repositoryModulesDi = GetIt.instance;

void _repositoryModulesInit() {
  repositoryModulesDi.registerLazySingleton<RepositoryContract>(
    () => Repository(
      remoteDataSource: repositoryModulesDi(),
    ),
  );
}

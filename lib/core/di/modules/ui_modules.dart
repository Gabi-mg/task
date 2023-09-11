part of 'package:task/core/di/app_di.dart';

final uiModulesDi = GetIt.instance;

void _uiModulesInit() {
  //Blocs
  uiModulesDi.registerFactory(
    () => LanguageBloc(),
  );

  uiModulesDi.registerFactory(
    () => BottomNavigationBloc(),
  );
}

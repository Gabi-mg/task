
import 'package:get_it/get_it.dart';
import 'package:task/ui/blocs/language/language_bloc.dart';
import 'package:task/ui/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
//
// part 'modules/data_modules.dart';
// part 'modules/domain_modules.dart';
// part 'modules/repository_modules.dart';
part 'modules/ui_modules.dart';

Future<void> init() async {
  // _dataModulesInit();
  // _repositoryModulesInit();
  // _domainModulesInit();
  _uiModulesInit();
}

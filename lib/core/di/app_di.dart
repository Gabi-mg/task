import 'package:get_it/get_it.dart';
import 'package:task/core/network/dio_http_client.dart';
import 'package:task/core/network/interceptors/curl_dio_interceptor.dart';
import 'package:task/core/network/interceptors/queries_interceptor.dart';
import 'package:task/data/remote_datasource/api/api.dart';
import 'package:task/data/remote_datasource/remote_datasource.dart';
import 'package:task/data/repository/repository.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/open_weather.dart';
import 'package:task/ui/blocs/language/language_bloc.dart';
import 'package:task/ui/screens/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';

part 'modules/data_modules.dart';
part 'modules/domain_modules.dart';
part 'modules/repository_modules.dart';
part 'modules/ui_modules.dart';

Future<void> init() async {
  _dataModulesInit();
  _repositoryModulesInit();
  _domainModulesInit();
  _uiModulesInit();
}

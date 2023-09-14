import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/core/network/models/network_error.dart';
import 'package:task/data/remote_datasource/remote_datasource.dart';
import 'package:task/data/repository/repository.dart';

import '../helpers/mocks/data_mock.dart';
import '../helpers/mocks/domain_mock.dart';

class MockRemoteDatasource extends Mock implements RemoteDataSourceContract {}

void main() {
  late Repository repository;
  late MockRemoteDatasource mockRemoteDatasource;

  const String lang = 'en';
  const double lat = 51.50928768483664;
  const double lon = -0.13894392288012386;

  final forecastRemoteEntityMock = DataMock.forecastRemoteEntityMock();
  final forecastMock = DomainMock.forecastMock();

  setUp(() {
    mockRemoteDatasource = MockRemoteDatasource();
    repository = Repository(remoteDataSource: mockRemoteDatasource);
  });

  test('return forecast when the remote call is successfully', () async {
    when(() => mockRemoteDatasource.getForecast(any(), any(), any()))
        .thenAnswer((_) async => forecastRemoteEntityMock);

    final result = await repository.getForecast(lang, lat, lon);

    result.when(
      failure: (error) => fail('test failed'),
      success: (forecast) {
        verify(() => mockRemoteDatasource.getForecast(lang, lat, lon))
            .called(1);
        expect(forecast, forecastMock);
      },
    );
  });

  test('return failure when remote call is unsuccessfully', () async {
    when(() => mockRemoteDatasource.getForecast(any(), any(), any()))
        .thenThrow(Exception());

    final result = await repository.getForecast(lang, lat, lon);

    result.when(
        failure: (error) {
          verify(() => mockRemoteDatasource.getForecast(lang, lat, lon));
          expect(error, NetworkError.getException(error));
        },
        success: (forecast) => fail('test failed'));
  });
}

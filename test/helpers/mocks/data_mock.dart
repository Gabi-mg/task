import 'package:task/data/remote_datasource/models/models.dart';

class DataMock {
  static WeatherRemoteEntity weatherRemoteEntityMock() {
    return WeatherRemoteEntity(
      id: 804,
      main: 'Clouds',
      description: 'overcast clouds',
      icon: '04d',
    );
  }

  static MainRemoteEntity mainRemoteEntityMock() {
    return MainRemoteEntity(
      temp: 18.56,
      tempMin: 18.56,
      tempMax: 18.56,
      humidity: 67,
    );
  }

  static ListItemRemoteEntity listItemRemoteEntityMock() {
    return ListItemRemoteEntity(
      dt: 1694606400,
      main: mainRemoteEntityMock(),
      weather: [weatherRemoteEntityMock()],
    );
  }

  static ForecastRemoteEntity forecastRemoteEntityMock() {
    return ForecastRemoteEntity(
      list: [listItemRemoteEntityMock()],
    );
  }
}

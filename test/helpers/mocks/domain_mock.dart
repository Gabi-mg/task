import 'package:task/domain/models/models.dart';

class DomainMock {
  static Weather weatherMock() {
    return Weather(
      id: 804,
      main: 'Clouds',
      description: 'overcast clouds',
      icon: '04d',
    );
  }

  static Main mainMock() {
    return Main(
      temp: 18.56,
      tempMin: 18.56,
      tempMax: 18.56,
      humidity: 67,
    );
  }

  static ListItem listItemMock() {
    return ListItem(
      dt: 1694606400,
      main: mainMock(),
      weather: [weatherMock()],
    );
  }

  static Forecast forecastMock() {
    return Forecast(
      list: [listItemMock()],
    );
  }
}
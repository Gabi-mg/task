import 'package:task/domain/models/models.dart';

class Geolocation {
  Geolocation();

  Location getLocation(int index) {
    Location location = Location(
      lat: 51.50928768483664,
      lon: -0.13894392288012386,
    );

    switch (index) {
      case 1:
        location = Location(
          lat: 43.65447813264801,
          lon: -79.37891753054616,
        );
        break;
      case 2:
        location = Location(
          lat: 1.3558660882546987,
          lon: 103.8840919660724,
        );
        break;
    }

    return location;
  }
}

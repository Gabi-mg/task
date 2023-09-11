# task

### How to build the app

- Clean the project:
  `flutter clean`
- Delete autogenerated classes by freezed

  ```bash
    find . -name "*.g.dart" -delete
    find . -name "*.freezed.dart" -delete
  ```
- Get packages
  `flutter pub get`
- Flutter code generation
  `flutter pub run build_runner build --delete-conflicting-outputs`
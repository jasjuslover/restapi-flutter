# Study Flutter (for myself)

Just a simple flutter project for self-learn. This repository is using Poke Api. This app is simple demo apps based on BLoC pattern, a modern design pattern for flutter.

<img src="/screenshot/img_1.png" align="right" width="32%"/>

## Tech Stacks & Open-Source Libraries

- [BLoC Pattern](https://bloclibrary.dev/) - Business logic component to separate the business logic with UI.
- [Equatable](https://pub.dev/packages/equatable) - Being able to compare objects in `Dart` often involves having to override the `==` operator.
- [Retrofit](https://pub.dartlang.org/packages/retrofit) with [Dio](https://github.com/flutterchina/dio/) - A type-safe HTTP client.
- [Json Serializable](https://pub.dev/packages/json_serializable) - Builders for handling JSON.
- [Flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b) - Handling different environments for development and production.
- Handle State - (Loading, No Data, Has Data, No Internet Connection, Request Timeout, Error)

## How to run Flutter App

### Generated `*.g.dart` file

Before run the app, make sure you have an emulator running, or a device connected over USB and debugging enabled on that device. If you want to generate file `*.g.dart`, you can use this command on terminal.

One time build:

```console
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or you can watch for changes and rebuild automatically

```console
flutter pub run build_runner watch
```

### Run Flutter app between Flavor for development and production with command prompt

Development

```console
flutter run --flavor dev --target=lib/main.dart
```

Production

```console
flutter run --flavor prod --target=lib/main.dart
```

### License
```xml
MIT License

Copyright (c) 2020 Husni Kamal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

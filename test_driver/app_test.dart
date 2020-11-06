import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('restapi app', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Find Hello World App! text', () async {
      final text = find.text('Hello World App!');

      expect(await driver.getText(text), 'Hello World App!');
    });
  });
}

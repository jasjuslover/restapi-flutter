// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:restapi_flutter/main.dart';

void main() {
  testWidgets('Find text widget with Hello World App! text',
      (WidgetTester tester) async {
    // Build out app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Expect widget with described text
    expect(find.text('Hello World App!'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pet/modelview.dart';
// Import your PostView widget

void main() {
  testWidgets('PostView Widget Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: PostView(),
      ),
    );

    // Use tester to interact with the widget and make assertions
    // For example, you might want to verify the initial state, test user interactions, etc.
    // For this simple example, we'll just check if the widget is rendered without errors.

    // Verify that the PostView widget is rendered
    expect(find.byType(PostView), findsOneWidget);

    // You can add more test cases based on your widget's behavior
  });
}

// You can run this test by executing 'flutter test' in your terminal.

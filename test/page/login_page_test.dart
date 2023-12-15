import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet/login_page.dart';
// Sesuaikan dengan struktur proyek Anda

void main() {
  testWidgets('LoginPage Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LoginPage());

    // Verify that the Email and Password TextFields are present.
    expect(find.byType(TextField), findsNWidgets(2));

    // Enter text into Email and Password TextFields.
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Verify that the entered text is correct.
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);

    // Tap on the Login button.
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    // Add your verification logic here
    // For example, you can check if the navigation occurred or show a success message
    //expect(find.text('Login successful'), findsOneWidget);
  });
}

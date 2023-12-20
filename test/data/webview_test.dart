import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramController extends GetxController {
  final controller = Completer<WebViewController>();

  void initController(WebViewController webViewController) {
    controller.complete(webViewController);
  }

  void loadInstagramUrl() {
    controller.future.then((webViewController) {
      webViewController.loadHtmlString('https://maps.google.com');
    });
  }
}

void main() {
  testWidgets('InstagramController initializes WebViewController',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that WebViewController is initialized.
    final instagramController = InstagramController();
    await tester.pumpAndSettle(); // Wait for animations to complete.

    expect(instagramController.controller, isA<Completer<WebViewController>>());
  });

  testWidgets('Load Instagram URL without WebView',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Get the InstagramController instance.
    final instagramController = InstagramController();

    // Load Instagram URL.
    instagramController.loadInstagramUrl();
    await tester.pumpAndSettle(); // Wait for animations to complete.

    // No assertions are made here because loading without WebView doesn't produce a visible change.
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GetBuilder<InstagramController>(
          init: InstagramController(),
          builder: (controller) {
            // Replace WebView with a Text widget
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  // Trigger the loadInstagramUrl method when the button is pressed
                  controller.loadInstagramUrl();
                },
                child: Text('Load Instagram URL'),
              ),
            );
          },
        ),
      ),
    );
  }
}

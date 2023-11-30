import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0xFF000000))
    ..loadRequest(Uri.parse('https://maps.google.com'));
}

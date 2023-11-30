import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pet/app/routes/app_pages.dart';
import 'package:pet/style.dart';
import '../controllers/about_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutView extends GetView<AboutController> {
  final AboutController controller = Get.put(AboutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
          },
          icon: const Icon(Icons.arrow_back),
          color: orangeColor,
        ),
        title: Text(
          'Our Location',
          style: blackTextStyle2.copyWith(fontSize: 20),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications,
              color: Color(0xffffc482),
            ),
          )
        ],
      ),
      body: WebViewWidget(controller: controller.controller),
    );
  }
}

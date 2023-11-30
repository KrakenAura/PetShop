
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';

class StorageController extends ClientController {
  Storage? storage;
  @override
  void onInit() {
    super.onInit();
// appwrite
    storage = Storage(client);
  }

  Future storeImage() async {
    try {
      final result = await storage!.createFile(
        bucketId: '[6566f710d0ff5780ab22]',
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path:'https://cloud.appwrite.io/v1/storage/buckets/6566f710d0ff5780ab22/files/6566f7d3214af0902a7e/view?project=6566ee7c678a3e68a58a&mode=admin',
          filename: 'background.jpg',
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}

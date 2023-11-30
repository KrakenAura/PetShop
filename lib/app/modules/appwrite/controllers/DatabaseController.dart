
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "6566f53c24bce25427c1",
        documentId: ID.unique(),
        collectionId: "6566f54919c1da36ed45",
        data: map,
        permissions: [
          Permission.read(Role.user("6566f6c01b8cd8516ee6")),
          Permission.update(Role.user("6566f6c01b8cd8516ee6")),
          Permission.delete(Role.user("6566f6c01b8cd8516ee6")),
        ],
      );
      print("DatabaseController:: storeUserName $databases");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
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

import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/models.dart';
import 'package:http/http.dart' as http;
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';

class DatabaseController extends ClientController {
  late Databases databases;
  late http.Client httpClient;

  void initialize() {
    httpClient = http.Client();
    databases = Databases(Appwrite(httpClient));
    databases.init();
  }
  
  Future<void> setMockHttpClient(http.Client httpClient) async {
    client.setHttpClient(httpClient);
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

  Future<void> updateAppwriteDocument(
      String documentId, String updatedNama) async {
    final ClientController clientController = Get.find<ClientController>();
    final client = clientController.client;

    final database = Databases(client);

    try {
      await database.updateDocument(
        collectionId: '6566f54919c1da36ed45',
        databaseId: '6566f53c24bce25427c1',
        documentId: documentId,
        data: {
          'Nama': updatedNama,
        },
      );
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  Future<void> deleteDocument(String documentId) async {
    final database = Databases(client);
    try {
      await database.deleteDocument(
        collectionId: '6566f54919c1da36ed45',
        databaseId: '6566f53c24bce25427c1',
        documentId: documentId,
      );
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  Future<List<Document>> getDataList() async {
    final database = Databases(client);
    try {
      DocumentList response = await database.listDocuments(
        collectionId: '6566f54919c1da36ed45',
        databaseId: '6566f53c24bce25427c1',
      );

      return response.documents;
    } catch (e) {
      print('Error getting data list: $e');
      rethrow;
    }
  }

  Future<void> createAppwriteDocument(
      String nama, String jenis, int usia, String warna) async {
    // Get the existing ClientController
    final ClientController clientController = Get.put(ClientController());

    final client = clientController.client;

    final database = Databases(client);
    final sequentialIdController = Get.put(SequentialIdController());

    try {
      final nextId = sequentialIdController.IdPesanan();
      final result = await database.createDocument(
        documentId: nextId.toString(),
        databaseId: '6566f53c24bce25427c1', // Replace with your database ID
        collectionId: '6566f54919c1da36ed45', // Replace with your collection ID
        data: {
          'Nama': nama,
          'Jenis': jenis,
          'Usia': usia,
          'Warna': warna,
          'idPet': nextId,
        }, // Replace with your document data
        // read: ['*'], // Replace with the appropriate read permissions
        // write: ['*'], // Replace with the user ID or role ID for write permissions
      );

      print('Document created successfully: ${result.data}');
    } catch (e) {
      print('Error creating document: $e');
    }
  }
}

class SequentialIdController extends GetxController {
  RxInt currentId = 0.obs;

  int IdPesanan() {
    currentId++;
    return currentId.value;
  }
}

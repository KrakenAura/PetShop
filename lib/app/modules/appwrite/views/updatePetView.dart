import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:appwrite/models.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';

class UpdatePetView extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final Document document;

  UpdatePetView({required this.document}) {
    namaController.text = document.data['nama'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await updateAppwriteDocument(document.$id, namaController.text);
                Get.back();
              },
              child: Text('Update Cat'),
            ),
          ],
        ),
      ),
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

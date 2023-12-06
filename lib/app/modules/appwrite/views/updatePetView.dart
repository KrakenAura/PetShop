import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:pet/app/routes/app_pages.dart';
import 'package:appwrite/models.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';
import '../views/PetView.dart';

class UpdatePetView extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    final Document document = Get.arguments as Document;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Pet Name'),
              initialValue: document.data['nama'].toString(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the update function
                updateDocument(document.$id);
              },
              child: Text('Update Pet'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update the document
  Future<void> updateDocument(String documentId) async {
    try {
      // Update the document with new data
      await database.updateDocument(
        collectionId: '656f243bd53ab5dd346b',
        databaseId: '656f2434c46e4f2c065d',
        documentId: documentId,
        data: {'nama': namaController.text},
      );

      // Navigate back to the previous screen
      Get.back();
    } catch (e) {
      print('Error updating document: $e');
    }
  }
}

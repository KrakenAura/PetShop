import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:pet/app/routes/app_pages.dart';
import 'package:appwrite/models.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';
import '../views/PetView.dart';
import '../views/deletePetView.dart';

class UpdatePetView extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    final Document document = Get.arguments as Document;

    // Set the initial value of the TextEditingController
    namaController.text = document.data['nama'].toString();

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
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the update function
                updateDocument(document.$id, namaController.text);
              },
              child: Text('Update Pet'),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to update the document
class _DataListState extends State<DataList> {
  late ClientController clientController;
  late Client client;
  late Databases database;

  @override
  void initState() {
    super.initState();
    clientController = widget.clientController;
    client = clientController.client;
    database = Databases(client);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Document>>(
      future: getDataList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        List<Document>? dataList = snapshot.data;

        if (dataList == null || dataList.isEmpty) {
          return Text('No data available.');
        }

        return Expanded(
          child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              Document document = dataList[index];

              return ListTile(
                title: Text(document.data?['nama']?.toString() ?? 'No Name'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteDocument(document.$id);
                        setState(() {});
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Navigate to the update screen
                        Get.toNamed(Routes.UPDATE_uPETVIEW,
                            arguments: document);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    Future<void> updateDocument(String documentId, String updatedName) async {
      try {
        await database.updateDocument(
          collectionId: '656f243bd53ab5dd346b',
          databaseId: '656f2434c46e4f2c065d',
          documentId: documentId,
          data: {'nama': updatedName},
        );

        // Navigate back to the previous screen
        Get.back();
      } catch (e) {
        print('Error updating document: $e');
      }
    }
  }
}

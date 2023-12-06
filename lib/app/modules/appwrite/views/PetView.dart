import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pet/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';
import 'package:pet/style.dart';
import 'package:flutter/material.dart';

class PetView extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController usiaController = TextEditingController();
  final TextEditingController warnaController = TextEditingController();
  final TextEditingController paketController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Appwrite Example'),
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
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: jenisController,
                decoration: InputDecoration(labelText: 'Jenis'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: usiaController,
                decoration: InputDecoration(labelText: 'Usia'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: warnaController,
                decoration: InputDecoration(labelText: 'Warna'),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  int usia = int.tryParse(usiaController.text) ?? 0;
                  await createAppwriteDocument(namaController.text,
                      jenisController.text, usia, warnaController.text);
                },
                child: Text('Create Document in Appwrite'),
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.DELETE_PETVIEW);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: orangeColor,
                  ),
                  child: Text(
                    'Update and Delete',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, backgroundColor: orangeColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SequentialIdController extends GetxController {
  RxInt currentId = 0.obs;

  int IdPesanan() {
    currentId++;
    return currentId.value;
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

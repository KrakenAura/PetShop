import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:pet/app/routes/app_pages.dart';
import 'package:appwrite/models.dart';
import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';
import '../views/PetView.dart';

class deletePetView extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Available Cat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DataList(clientController: clientController),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.PETVIEW);
                },
                child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange, // Change the button color here
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 36,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DataList extends StatefulWidget {
  final ClientController clientController;

  DataList({required this.clientController});

  @override
  _DataListState createState() => _DataListState();
}

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

        return Expanded(
          child: ListView.builder(
            itemCount: dataList?.length ?? 0,
            itemBuilder: (context, index) {
              Document document = dataList![index];

              return ListTile(
                title: Text(document.data['nama'].toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteDocument(document.$id);
                    setState(() {});
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<List<Document>> getDataList() async {
    try {
      DocumentList response = await database.listDocuments(
        collectionId: '656f243bd53ab5dd346b',
        databaseId: '656f2434c46e4f2c065d',
      );

      return response.documents;
    } catch (e) {
      print('Error getting data list: $e');
      rethrow;
    }
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      await database.deleteDocument(
        collectionId: '656f243bd53ab5dd346b',
        databaseId: '656f2434c46e4f2c065d',
        documentId: documentId,
      );
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}

import 'package:appwrite/models.dart' as appwrite;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pet/app/modules/appwrite/controllers/DatabaseController.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('DatabaseController Tests', () {
    late DatabaseController databaseController;

    setUp(() {
      // Set up the Appwrite client for testing
      databaseController = DatabaseController();
      databaseController.client.setEndpoint('https://cloud.appwrite.io/v1');
      databaseController.client.setProject('6566852fe932a7ab011a');
      databaseController.client.setSelfSigned(status: true);

      // Mock HTTP client for testing
final MockClient mockClient = MockClient((http.Request request) async {
        // Implement dynamic mock responses based on the request
        if (request.url.path == '/v1/documents') {
          return http.Response('{"key": "value"}', 200);
        } else {
          return http.Response('{"error": "Not Found"}', 404);
        }
      });

// Create a new Appwrite client with the mock HTTP client
      databaseController.client = Client()
        ..setEndpoint('https://cloud.appwrite.io/v1')
        ..setProject('6566852fe932a7ab011a')
        ..setSelfSigned(status: true)
        ..setHttpClient(mockClient);


      // Initialize GetX bindings
      Get.testMode = true;
    });

    test('Fetch Data from Appwrite', () async {
      final initialDocumentCount =
          (await databaseController.getDataList()).length;

      // Add your assertions based on the expected behavior
      expect(initialDocumentCount, greaterThanOrEqualTo(0));
    });

    test('Create Book', () async {
      final initialDocumentCount =
          (await databaseController.getDataList()).length;
      await databaseController.createAppwriteDocument(
          'tes nama', 'tes jenis', 1, 'tes warna');

      final updatedDocumentCount =
          (await databaseController.getDataList()).length;

      // Add your assertions based on the expected behavior
      expect(updatedDocumentCount, equals(initialDocumentCount + 1));
    });

    test('Edit Book', () async {
      // Assuming you have at least one book in the database
      final documentId = '656fe308252c556e76ac';

      // Fetch the initial state of the document
      final List<appwrite.Document> documents =
          await databaseController.getDataList();
      final initialDocument = documents.firstWhere(
        (document) => document.data['id'] == documentId,
      );

      // Update the document
      final updatedName = 'tes nama';
      await databaseController.updateAppwriteDocument(documentId, updatedName);

      // Fetch the updated state of the document
      final List<appwrite.Document> updatedDocuments =
          await databaseController.getDataList();
      final updatedDocument = updatedDocuments.firstWhere(
        (document) => document.data['id'] == documentId,
      );

      // Access data field to check the name
      final updatedNameFromData = updatedDocument.data['Nama'];

      // Add your assertions based on the expected behavior
      expect(updatedNameFromData, equals(updatedName));
    });

    test('Delete Book', () async {
      // Assuming you have at least one book in the database
      final documentId =
          '656fe308252c556e76ac'; // Replace with a valid document ID

      final initialDocumentCount =
          (await databaseController.getDataList()).length;

      await databaseController.deleteDocument(documentId);

      final updatedDocumentCount =
          (await databaseController.getDataList()).length;

      // Assert that the document count is reduced by one
      expect(updatedDocumentCount, equals(initialDocumentCount - 1));
    });

    test('Error Handling', () async {
      // Update the mock response to simulate an error
      databaseController.client
          .setHttpClient(MockClient((http.Request request) async {
        return http.Response('{"error": "Simulated Error"}', 500);
      }));

      // Perform an operation that triggers an error
      await expectLater(
        databaseController.createAppwriteDocument('test', 'test', 1, 'test'),
        throwsA(isA<Exception>()),
      );

      // Add assertions to check the error dialog or any other error-handling mechanism
    });

    test('Sequential ID Generation', () {
      final sequentialIdController = SequentialIdController();

      final id1 = sequentialIdController.IdPesanan();
      final id2 = sequentialIdController.IdPesanan();

      expect(id2, equals(id1 + 1));
    });
  });
}

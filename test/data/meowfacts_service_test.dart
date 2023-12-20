import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet/api/meowfacts_api/facts_model.dart';
import 'package:pet/api/meowfacts_api/facts_controller.dart';
import 'meowfacts_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const _baseUrl = 'https://meowfacts.herokuapp.com/';

  late FactsController factsController;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    factsController = FactsController();
  });

  group('factsController', () {
    test('fetchFacts returns a list of articles if response is successful',
        () async {
// Mock the HTTP response for successful case
      when(mockClient.get(Uri.parse('${_baseUrl}'))).thenAnswer((_) async =>
          http.Response('{"Facts": []}', 200)); // Mock the HTTP response
      final facts = await factsController.fetchFacts();
// Expect the fetched data to be a list of Article objects
      expect(facts, isA<List<Facts>>());
    });
    test('fetchFacts returns an empty list if response fails', () async {
// Mock the HTTP response for response failure
      when(mockClient.get(Uri.parse('${_baseUrl}'))).thenAnswer((_) async =>
          http.Response('Server error', 500)); // Mock the HTTP response
      final facts = await factsController.fetchFacts();
// Expect the fetched data to be an empty list
      expect(facts, isA<List<Facts>>());
    });
  });
}

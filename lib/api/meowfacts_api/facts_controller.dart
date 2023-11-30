import 'package:get/get.dart';
import 'dart:convert';
import 'package:pet/api/meowfacts_api/facts_model.dart';
import 'package:http/http.dart' as http;

class FactsController extends GetxController {
  var pets = <Facts>[].obs;
  RxList<Facts> facts = RxList<Facts>([]);

  @override
  void onInit() {
    super.onInit();
    fetchFacts();
  }

  Future<void> fetchFacts() async {
    try {
      final response =
          await http.get(Uri.parse('https://meowfacts.herokuapp.com/'));
      if (response.statusCode == 200) {
        final parsedData = Facts.fromJson(json.decode(response.body));
        facts.assignAll([parsedData]);
        print("Berhasil");
      } else {
        print("Gagal");
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      // Tangani kesalahan
    }
  }
}

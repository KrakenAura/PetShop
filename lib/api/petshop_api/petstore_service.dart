import 'package:dio/dio.dart';
import 'api_endpoints.dart';
import 'pet_model.dart';

class PetstoreService {
  final Dio _dio = Dio();

  Future<List<Pet>> fetchPets() async {
    try {
      final response = await _dio.get(ApiEndpoints.baseUrl + ApiEndpoints.pets);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Pet> pets = data.map((json) => Pet.fromJson(json)).toList();
        return pets;
      } else {
        throw Exception('Gagal mengambil data hewan peliharaan');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}






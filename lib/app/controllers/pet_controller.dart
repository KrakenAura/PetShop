import '../../api/petshop_api/petstore_service.dart';
import 'package:get/get.dart';
import '../../api/petshop_api/pet_model.dart';

class PetController extends GetxController {
  final PetstoreService _petstoreService = PetstoreService();
  var pets = <Pet>[].obs;

  List<Pet> dummyPets = [
    Pet(id: 1, name: "Fluffy", category: Category(id: 1, name: "Cats")),
    Pet(id: 2, name: "Buddy", category: Category(id: 2, name: "Dogs")),
    // Tambahkan lebih banyak data palsu sesuai kebutuhan
  ];


  @override
  void onInit() {
    super.onInit();
    // fetchPets();
    pets.assignAll(dummyPets);
  }

  Future<void> fetchPets() async {
    try {
      print(
          'Mengambil data hewan peliharaan...'); // Pernyataan print ini akan mencetak pesan saat metode ini dijalankan.
      final fetchedPets = await _petstoreService.fetchPets();
      pets.assignAll(fetchedPets);
      print('Data hewan peliharaan berhasil diambil: $pets');
    } catch (e) {
      print('Terjadi kesalahan: $e');
      // Tangani kesalahan
    }
  }
}

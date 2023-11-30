class PetShopAPI {
  // Base URL dari Petstore API
  static const String baseUrl = 'https://petstore.swagger.io/v2';

  // Endpoint untuk mendapatkan daftar hewan peliharaan
  static const String pets = '/pet/findByStatus';

  // Endpoint untuk membuat pesanan
  static const String createOrder = '/store/order';

  // Endpoint untuk mendapatkan daftar pesanan
  static const String orders = '/store/inventory';

  // Endpoint untuk menghapus pesanan berdasarkan ID
  static const String deleteOrder = '/store/order/';

}

// import 'package:flutter/material.dart';
// import 'package:pet/app/modules/Homepage/views/homepage_view.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'style.dart';
// import 'API.dart';

// class MakeupProduct {
//   final String name;
//   final String brand;
//   final String category;
//   final String image; // Tambahkan atribut URL gambar

//   MakeupProduct({
//     required this.name,
//     required this.brand,
//     required this.category,
//     required this.image, // Tambahkan atribut URL gambar
//   });

//   factory MakeupProduct.fromJson(Map<String, dynamic> json) {
//     return MakeupProduct(
//       name: json['name'],
//       brand: json['brand'],
//       category: json['category'],
//       image: json['image_link'], // Ganti dengan atribut URL gambar yang sesuai
//     );
//   }
// }

// class MakeupProductList extends StatefulWidget {
//   @override
//   _MakeupProductListState createState() => _MakeupProductListState();
// }

// class _MakeupProductListState extends State<MakeupProductList> {
//   List<MakeupProduct> products = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(
//       Uri.parse(
//           'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body) as List<dynamic>;
//       setState(() {
//         products =
//             data.map((product) => MakeupProduct.fromJson(product)).toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return HomepageView();
//             }));
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: blueColor,
//         ),
//         title: Text(
//           'Jual API',
//           style: blueTextStyle2.copyWith(fontSize: 20),
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 16),
//             child: Icon(
//               Icons.notifications,
//               color: blueColor,
//             ),
//           )
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               products[index].name,
//               style: blueTextStyle2.copyWith(fontSize: 16),
//             ),
//             subtitle: Text(
//               'Brand: ${products[index].brand}\nCategory: ${products[index].category}',
//               style: blueTextStyle3.copyWith(fontSize: 12),
//             ),
//             leading: Image.network(
//               products[index].image, // Menampilkan gambar dari URL
//               width: 80, // Sesuaikan lebar gambar sesuai kebutuhan
//               height: 80, // Sesuaikan tinggi gambar sesuai kebutuhan
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

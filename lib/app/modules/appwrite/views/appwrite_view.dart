// // import 'dart:ffi';
// // import 'package:appwrite/appwrite.dart';
// // import 'package:get/get.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pet/app/modules/appwrite/controllers/client_controller.dart';
// // import 'package:pet/app/modules/appwrite/controllers/storage_controller.dart';

// // class AppWriteView extends StatelessWidget {
// //   final StorageController _storageController = Get.put(StorageController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Appwrite Storage Test'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await _storageController.storeImage();
// //               },
// //               child: Text('Store Image'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:get/get.dart';
// import 'package:pet/app/modules/appwrite/controllers/account_controller.dart';
// import 'package:pet/style.dart';
// import 'package:flutter/material.dart';
// import 'package:pet/app/routes/app_pages.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AccountController _accountController = Get.put(AccountController());

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Get.toNamed(Routes.HOME);
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: orangeColor,
//         ),
//         title: Text(
//           'Login',
//           style: blackTextStyle2.copyWith(fontSize: 20),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 _accountController.createEmailSession({
//                   'email': _emailController.text,
//                   'password': _passwordController.text,
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: orangeColor,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 fixedSize: Size(150, 50),
//               ),
//               child: Obx(() => _accountController.isLoading.value
//                   ? CircularProgressIndicator()
//                   : Text('Login')),
//             ),
//             SizedBox(height: 10),
//             Container(
//               width: 150,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Get.toNamed(Routes.REGISTER);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: orangeColor,
//                 ),
//                 child: Text(
//                   'Register',
//                   style: whiteTextStyle.copyWith(
//                     fontSize: 16,
//                     backgroundColor: orangeColor,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

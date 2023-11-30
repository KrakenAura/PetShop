// import 'package:flutter/material.dart';
// import 'package:pet/APIService.dart';
// import 'package:pet/app/modules/Homepage/views/homepage_view.dart';
// import 'package:pet/todo.dart';
// import 'APIService.dart';

// void main() => runApp(API());

// class API extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return HomepageView();
//                 }));
//               },
//               icon: const Icon(Icons.arrow_back),
//               color: Colors.black),
//           title: Text(
//             'Hasil API',
//           ),
//           elevation: 0,
//           actions: [
//             Container(
//               margin: const EdgeInsets.only(right: 16),
//               child: Icon(
//                 Icons.notifications,
//                 color: Colors.black,
//               ),
//             )
//           ],
//         ),
//         body: FutureBuilder<Todo>(
//           future: APIService().fetchTodo(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error.toString()}');
//             } else {
//               final todo = snapshot.data;
//               return ListTile(
//                   shape: BeveledRectangleBorder(
//                     side: BorderSide(color: Colors.black, width: 1),
//                   ),
//                   title: Text(
//                       'ID: ${todo?.id.toString()} UserID: ${todo?.userId.toString()}'),
//                   subtitle: Text(
//                     'Title: ${todo?.title}',
//                   ));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

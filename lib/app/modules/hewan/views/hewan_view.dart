import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/app/routes/app_pages.dart';
import '../controllers/hewan_controller.dart';
import '../../../controllers/pet_controller.dart';
import '../../../../api/meowfacts_api/facts_controller.dart';
import 'package:pet/style.dart';

class HewanView extends StatelessWidget {
  final FactsController factsController = Get.put(FactsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOMEPAGE);
          },
          icon: const Icon(Icons.arrow_back),
          color: orangeColor,
        ),
        title: Text(
          'Cat Facts',
          style: blackTextStyle2.copyWith(fontSize: 20),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications,
              color: Color(0xffffc482),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (factsController.facts.isNotEmpty) {
          final data = factsController.facts.first;
          final fakta = data.data.first;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/backgroundinpo.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(5, 5),
                            blurRadius: 10)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('$fakta', style: blackTextStyle2),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  factsController.fetchFacts();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffffc482),
                ),
                child: Text(
                  'Refresh',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator(); // Atau widget lain yang sesuai untuk menunggu data.
        }
      }),
    );
  }
}

// class HewanView extends GetView<PetController> {
//   const HewanView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HewanView'),
//         centerTitle: true,
//       ),
//       body: Obx(
//         () {
//           if (controller.pets.isEmpty) {
//             return Center(
//               child:
//                   CircularProgressIndicator(),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: controller.pets.length,
//               itemBuilder: (context, index) {
//                 final pet = controller.pets[index];
//                 return ListTile(
//                   title: Text(pet.name),
//                   subtitle: Text('ID: ${pet.id}'),
//                   // Tambahkan widget lainnya sesuai kebutuhan
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

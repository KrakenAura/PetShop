import 'package:flutter/material.dart';
import 'package:pet/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../../style.dart';
import '../controllers/homepage_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'cards.dart';
import 'cards2.dart';
import 'cards3.dart';
import 'cards4.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
          icon: const Icon(Icons.arrow_back),
          color: orangeColor,
        ),
        title: Text(
          'Malang',
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
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SearchBox//
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                        style: searchBarText,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffff2f2f2),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Color(0xfff8b8c89),
                        )),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: blackTextStyle2.copyWith(
                    fontSize: 22,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your "View All" button functionality here
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.orange,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Cards(), Cards2(), Cards3(), Cards4()],
            ),
            SizedBox(height: 16.0),
            Center(
              // Center the BigCard
              child: BigCard(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
          gap: 10,
          activeColor: orangeColor,
          color: greyColor,
          padding: EdgeInsets.only(bottom: 20),
          tabMargin: EdgeInsets.only(left: 24, right: 24),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.chat_bubble,
              text: 'Chat',
            ),
            GButton(
              icon: Icons.view_timeline,
              onPressed: () {
                Get.toNamed(Routes.HEWAN);
              },
              text: 'Timeline',
            ),
            GButton(
              icon: Icons.account_circle_rounded,
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              },
              text: 'Profile',
            ),
          ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 36.0),
            SizedBox(height: 8.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        // Add a Container to wrap the Column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Moni Charlie',
              style: blackTextStyle2.copyWith(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Distance (Near 10km)',
              style: greyTextStyle2.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Container(
              // Add the container inside the Column
              width: double.infinity, // Take up the full width
              height: 100.0, // Set the desired height
              color: Colors.white, // Background color of the container
              child: Center(
                child: Text(
                  'Moni Charlie',
                  style: blackTextStyle2.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

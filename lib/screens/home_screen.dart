import 'package:cred/controllers/home_controller.dart';
import 'package:cred/controllers/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());
  final bottomNavigationController = Get.put(BottomNavigationController());
  final navigationIcons = [
    Icons.home,
    Icons.credit_card,
    Icons.notifications,
    Icons.settings,
  ];// Initial selected index for bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cred'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[200],
        actions: [
          // Add profile picture icon
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () =>
                Get.toNamed('/profile'), // Replace with your profile route
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/9/9d/CRED-LOGO2.png'),
            width: 300,
            height: 300,),
            // Credit Card Summary
            Row(
              children: [
                Text('Total Credit Limit:'),
                Spacer(),
                Obx(() =>
                    Text('₹ ${homeScreenController.totalCreditLimit.value}')),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text('Available Credit:'),
                Spacer(),
                Obx(() =>
                    Text('₹ ${homeScreenController.availableCredit.value}')),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text('Upcoming Due:'),
                Spacer(),
                Obx(() =>
                    Text('₹ ${homeScreenController.upcomingDue
                        .value} (15th April)')),
              ],
            ),
            Divider(),


            // Cards Section (using Wrap for flexible layout)
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: List.generate(
                homeScreenController.cards.length,
                    (index) =>
                    InkWell(
                      onTap: () => homeScreenController.cards[index]['onTap'](),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Icon(
                                homeScreenController.cards[index]['icon'],
                                size: 40.0,
                              ),
                              SizedBox(height: 10.0),
                              Text(homeScreenController.cards[index]['title']),
                            ],
                          ),
                        ),
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

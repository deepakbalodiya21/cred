import 'package:cred/controllers/home_controller.dart';
import 'package:cred/screens/pay_bill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen1 extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());
  HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[200],
      ),
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/9/9d/CRED-LOGO2.png'),
            width: 100,
            height: 100,
          ),
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
              Obx(() => Text(
                  '₹ ${homeScreenController.upcomingDue.value} (15th April)')),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(PayBill());
              },
              child: Text('Pay Bill')),
          Divider(),
        ],
      ),
    );
  }
}

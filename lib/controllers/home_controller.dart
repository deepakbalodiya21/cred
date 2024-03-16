import 'package:cred/screens/pay_bill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final totalCreditLimit = 100000.obs;
  final availableCredit = 80000.obs;
  final upcomingDue = 20000.obs;

  // You might add data for cards, offers, etc. (replace with your actual data structure)
  final List<Map<String, dynamic>> cards = [
    {
      'title': 'Pay Bills',
      'icon': Icons.payment,
      'onTap': () => Get.to(PayBill()), // Replace with your navigation route
    },
    // Add more card data (title, icon, onTap function)
  ];
}

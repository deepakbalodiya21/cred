import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class PayBill extends StatelessWidget {
  const PayBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Bill'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Pay Bill'),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                      Get.off(HomeScreen());
                      SnackBar(content: Text('Bill Paid Successfully !!..'));
                  },
                  child: Text('Pay'),
                ),
              ],
            ),
          ),
      ),
      ),
    );
  }
}

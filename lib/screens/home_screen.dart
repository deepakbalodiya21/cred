import 'package:cred/screens/first_screen.dart';
import 'package:cred/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: HomeScreen1(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

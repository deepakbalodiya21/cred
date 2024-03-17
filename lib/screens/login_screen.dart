import 'package:cred/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cred'),
        backgroundColor: Colors.blueGrey[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/9/9d/CRED-LOGO2.png'),
                width: 300,
                height: 300,
              ),
              Text('mobile no and passwords are any digit'),
              // Login Form
              TextField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType:
                    TextInputType.phone, // Optional, depending on input format
                onChanged: (value) =>
                    loginController.mobileNumber.value = value,
              ),
              SizedBox(height: 10.0),
              Obx(
                () => TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: loginController.togglePasswordVisibility,
                    ),
                  ),
                  obscureText: !loginController.isPasswordVisible.value,
                  onChanged: (value) => loginController.password.value = value,
                ),
              ),
              SizedBox(height: 20.0),
              // Login Button with conditional enabling
              Obx(
                () => ElevatedButton(
                  onPressed: loginController.mobileNumber.isEmpty ||
                          loginController.password.isEmpty
                      ? null
                      : () => loginController.login(context),
                  child: Text('Login'),
                ),
              ),

              // Divider and Sign Up Text
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  SizedBox(width: 5.0),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                        context, '/signup'), // Replace with your signup route
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

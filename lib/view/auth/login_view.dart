import 'package:flutter/material.dart';
import 'package:flutter_mvvm_learning/utils/routes/routes_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}

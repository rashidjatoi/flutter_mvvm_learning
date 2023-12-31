import 'package:flutter/material.dart';
import 'package:flutter_mvvm_learning/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_learning/view/auth/login_view.dart';
import 'package:flutter_mvvm_learning/view/home/home_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => const LoginView());

      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Error: Page Not Found')),
      ),
    );
  }
}

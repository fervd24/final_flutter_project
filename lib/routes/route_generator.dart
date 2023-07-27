
import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/information/info_model.dart';
import 'package:flutter_final_project/view/screens/info_screen.dart';
import 'package:flutter_final_project/view/screens/loading_screen.dart';
import 'package:flutter_final_project/view/screens/login_screen.dart';
import 'package:flutter_final_project/view/screens/menu_screen.dart';
import 'package:flutter_final_project/view/screens/qr_screen.dart';
import 'package:flutter_final_project/view/screens/serial_number_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case '/menu':
        return MaterialPageRoute(builder: (context) => const MenuScreen());
      case '/scanner':
        return MaterialPageRoute(builder: (context) => const QRScannerScreen());
      case '/information':
        return MaterialPageRoute(builder: (context) =>  InfoScreen(info: settings.arguments as InfoModel,));
      case '/serial':
        return MaterialPageRoute(builder: (context) => const SerialNumberScreen());
      case '/loading':
        return MaterialPageRoute(builder: (context) => const LoadingScreen());
      default:
      return  _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  });
}
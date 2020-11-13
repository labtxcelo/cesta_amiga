import 'package:cesta_amiga/controllers/auth_controller.dart';
import 'package:cesta_amiga/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cesta Amiga',
      home: LoginScreen(),
    );
  }
}

import 'package:cesta_amiga/library/base_store/loading_store.dart';
import 'package:cesta_amiga/library/base_store/navigator_store.dart';
import 'package:cesta_amiga/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'controllers/auth_controller.dart';
import 'screens/login_screen.dart';

void main() {
  _registerStores();

  runApp(MyApp());
}

_registerStores() {
  GetIt getIt = GetIt.I;

  // * BASE *
  getIt.registerSingleton(NavigatorStore());
  getIt.registerSingleton(LoadingStore());

  // * APPLICATION *

  getIt.registerSingleton(AuthController());
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

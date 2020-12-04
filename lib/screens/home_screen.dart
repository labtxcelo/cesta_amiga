import 'package:cesta_amiga/controllers/auth_controller.dart';
import 'package:cesta_amiga/screens/solicitante_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'feed_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authController = GetIt.I<AuthController>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: authController.user.tipoUsuario.toLowerCase() == "doador"
          ? FeedScreen()
          : SolicitanteScreen(),
    );
  } //end build

} //end class

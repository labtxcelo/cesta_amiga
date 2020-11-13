import 'package:cesta_amiga/componentes/text_field_componente.dart';
import 'package:cesta_amiga/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
          child: _buildBody(context)),
    );
  }
}

Widget _buildBody(BuildContext context) {
  final loginController = LoginController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Observer(
        builder: (_) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            height: loginController.cadastro == false ? 350 : 450,
            width: 270,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset("images/icCesta.png", height: 60, width: 60),
                  SizedBox(
                    height: 16,
                  ),
                  TextFieldComponente(
                    title: "E-mail",
                    inputType: TextInputType.emailAddress,
                    maxLength: 48,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldComponente(
                    title: "Senha",
                    isPassword: true,
                    maxLength: 48,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 36,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.blueAccent),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Não possui conta? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                    InkWell(
                      onTap: () {
                        loginController.changeCadastro(true);
                      },
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ])
                ],
              ),
            )),
      )
    ],
  );
}

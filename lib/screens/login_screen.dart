import 'dart:math';

import 'package:cesta_amiga/componentes/text_field_componente.dart';
import 'package:cesta_amiga/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = LoginController();

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
          child: _buildBody(context, loginController)),
    );
  }
}

Widget _buildBody(BuildContext context, LoginController loginController) {
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
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                        mainAxisAlignment: loginController.cadastro == false
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          loginController.cadastro == false
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.only(right: 58),
                                  child: IconButton(
                                    onPressed: () {
                                      loginController.changeCadastro(false);
                                    },
                                    icon: Icon(Icons.chevron_left_outlined),
                                  ),
                                ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                loginController.cadastro == false
                                    ? "Bem vindo ao Cesta Amiga!"
                                    : "Cadastro",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ]),
                  ),
                  Image.asset("images/icCesta.png", height: 60, width: 60),
                  SizedBox(
                    height: 16,
                  ),
                  Observer(
                      builder: (_) => loginController.cadastro == false
                          ? _buildConteudoLogin(context, loginController)
                          : _buildConteudoCadastro(context, loginController)),
                  Observer(
                      builder: (_) => loginController.cadastro == false
                          ? Container()
                          : _textReturn(context, loginController))
                ],
              ),
            )),
      )
    ],
  );
}

Widget _textReturn(BuildContext context, LoginController loginController) {
  return Padding(
    padding: const EdgeInsets.only(top: 12),
    child: InkWell(
      onTap: () {
        loginController.changeCadastro(false);
      },
      child: Text(
        "Já sou cadastrado!",
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildConteudoLogin(
    BuildContext context, LoginController loginController) {
  return Column(
    children: [
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
            borderRadius: BorderRadius.circular(24), color: Colors.blueAccent),
        child: MouseRegion(
          child: Center(
            child: Text(
              "Entrar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              //textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      SizedBox(height: 8),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Não possui conta? ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
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
  );
}

Widget _buildConteudoCadastro(
    BuildContext context, LoginController loginController) {
  return Container(
    height: 400,
    child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        _buildRadios(context, loginController),
        SizedBox(height: 12),
        TextFieldComponente(
          title: "Nome Completo",
          inputType: TextInputType.text,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
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
          height: 8,
        ),
        TextFieldComponente(
          title:
              loginController.typePeople == TypePeopleState.PF ? "CPF" : "CNPJ",
          inputType: TextInputType.number,
          maxLength: 48,
        ),
        loginController.typePeople == TypePeopleState.PF
            ? Container()
            : Column(
                children: [
                  SizedBox(height: 8),
                  TextFieldComponente(
                    title: "Razão Social",
                    inputType: TextInputType.number,
                    maxLength: 60,
                  ),
                ],
              ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "CEP",
          inputType: TextInputType.number,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Estado",
          inputType: TextInputType.text,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Cidade",
          inputType: TextInputType.text,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Bairro",
          inputType: TextInputType.text,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Logradouro",
          inputType: TextInputType.text,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Nº",
          inputType: TextInputType.text,
          maxLength: 10,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Complemento",
          inputType: TextInputType.text,
          maxLength: 10,
        ),
      ],
    ),
  );
}

_buildRadios(BuildContext context, LoginController loginController) {
  return Observer(
    builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Radio(
                value: TypePeopleState.PF,
                onChanged: (type) {
                  loginController.changeTypePeople(TypePeopleState.PF);
                  // tipoPessoa = 'PF';
                  // txtDocumentoCadastro.clear();
                },
                activeColor: Colors.blueAccent,
                groupValue: loginController.typePeople,
              ),
              Text("Pessoa Física",
                  style: TextStyle(
                      fontSize: 14,
                      color: loginController.typePeople == TypePeopleState.PF
                          ? Colors.blueAccent
                          : Colors.grey)),
            ],
          ),
          Column(
            children: <Widget>[
              Radio(
                value: TypePeopleState.PJ,
                activeColor: Colors.blueAccent,
                onChanged: (type) {
                  loginController.changeTypePeople(TypePeopleState.PJ);
                  // tipoPessoa = 'PJ';
                  // txtDocumentoCadastro.clear();
                },
                groupValue: loginController.typePeople,
              ),
              Text("Pessoa Jurídica",
                  style: TextStyle(
                      fontSize: 14,
                      color: loginController.typePeople == TypePeopleState.PJ
                          ? Colors.blueAccent
                          : Colors.grey))
            ],
          )
        ],
      );
    },
  );
}

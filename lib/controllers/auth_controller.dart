import 'package:cesta_amiga/library/base_store/base_stores.dart';
import 'package:cesta_amiga/library/utils/requests.dart';
import 'package:cesta_amiga/models/objects/UserAuth.dart';
import 'package:cesta_amiga/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  bool usuarioLogado = false;

  @observable
  String nomeUsuario;

  @observable
  UserAuth user;

  @action
  deslogar() {
    this.usuarioLogado = false;
  }

  @action
  cadastrarUsuario(dynamic body, BuildContext context) async {
    sendRequest
        .request(HttpMethod.POST, "usuario/cadastrar", body: body)
        .then((response) {
      print(response);
      this.usuarioLogado = true;
      login(body["email"], body["password"], context);
    }).catchError((onError) {
      print('Algo deu errado!');
      this.usuarioLogado = false;
      print(onError);
    });
  }

  @action
  login(String email, String password, BuildContext context) async {
    var body = {"email": email, "password": password};
    sendRequest
        .request(HttpMethod.POST, "auth/logar", body: body)
        .then((response) {
      print(response);
      this.usuarioLogado = true;
      this.nomeUsuario = response["nome"];
      this.user = UserAuth.map(response);
      Navigator.push(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }).catchError((onError) {
      print('Algo deu errado!');
      this.usuarioLogado = false;
      print(onError);
    });
  }
}

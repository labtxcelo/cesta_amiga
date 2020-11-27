import 'package:cesta_amiga/controllers/auth_controller.dart';
import 'package:cesta_amiga/library/base_widget/base_loading_screen.dart';
import 'package:cesta_amiga/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../componentes/text_field_componente.dart';
import '../controllers/login_controller.dart';
import '../library/base_store/base_stores.dart';
import 'home_screen.dart';

enum TipoModeEnum { DOADOR, RECEPTOR } //end enum

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TipoModeEnum _tipoUsuario = TipoModeEnum.DOADOR;
  String _tipoEscolhido = "DOADOR";

  LoginController loginController = LoginController();
  final authController = GetIt.I<AuthController>();

  final txtEmailLogin = TextEditingController();
  final txtSenhaLogin = TextEditingController();

  final txtNome = TextEditingController();
  final txtEmail = TextEditingController();
  final txtSenha = TextEditingController();
  final txtDocumento = TextEditingController();
  final txtCEP = TextEditingController();
  final txtEstado = TextEditingController();
  final txtCidade = TextEditingController();
  final txtBairro = TextEditingController();
  final txtLogradouro = TextEditingController();
  final txtNumero = TextEditingController();
  final txtComplemento = TextEditingController();
  String tipoPessoa;
  String tipoUsuario;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BaseLoadingWidget(
      body: Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
            child: _buildBody(context)),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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
                                      color: Colors.black,
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
                            ? _buildConteudoLogin(context)
                            : _buildConteudoCadastro(context)),
                    Observer(
                        builder: (_) => loginController.cadastro == false
                            ? Container()
                            : _textReturn(context))
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget _textReturn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: () {
          loginController.changeCadastro(false);
        },
        child: Text(
          "Já sou cadastrado!",
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildConteudoLogin(BuildContext context) {
    return Column(
      children: [
        TextFieldComponente(
          title: "E-mail",
          inputType: TextInputType.emailAddress,
          controller: txtEmailLogin,
          maxLength: 48,
        ),
        SizedBox(
          height: 8,
        ),
        TextFieldComponente(
          title: "Senha",
          isPassword: true,
          controller: txtSenhaLogin,
          maxLength: 48,
        ),
        SizedBox(height: 16),
        this._buildButtom(
          "Entrar",
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        SizedBox(height: 8),
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
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          )
        ])
      ],
    );
  }

  Widget _buildConteudoCadastro(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildRadios(context),
          SizedBox(height: 12),
          TextFieldComponente(
            title: "Nome Completo",
            inputType: TextInputType.text,
            controller: txtNome,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "E-mail",
            inputType: TextInputType.emailAddress,
            controller: txtEmail,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Senha",
            isPassword: true,
            controller: txtSenha,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: loginController.typePeople == TypePeopleState.PF
                ? "CPF"
                : "CNPJ",
            inputType: TextInputType.number,
            mask: loginController.typePeople == TypePeopleState.PF
                ? "###.###.###-##"
                : "##.###.###/####-##",
            controller: txtDocumento,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "CEP",
            inputType: TextInputType.number,
            mask: "#####-###",
            controller: txtCEP,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Estado",
            inputType: TextInputType.text,
            controller: txtEstado,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Cidade",
            inputType: TextInputType.text,
            controller: txtCidade,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Bairro",
            inputType: TextInputType.text,
            controller: txtBairro,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Logradouro",
            inputType: TextInputType.text,
            controller: txtLogradouro,
            maxLength: 48,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Nº",
            inputType: TextInputType.text,
            controller: txtNumero,
            maxLength: 10,
          ),
          SizedBox(height: 8),
          TextFieldComponente(
            title: "Complemento",
            inputType: TextInputType.text,
            controller: txtComplemento,
            maxLength: 12,
          ),
          SizedBox(height: 8),
          this._buildSeletor(),
          SizedBox(height: 16),
          this._buildButtom("Cadastrar", () {}),
        ],
      ),
    );
  }

  Widget _buildButtom(String text, Function fn) {
    return Container(
      height: 36,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.black),
      child: InkWell(
        onTap: () {
          fn();
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            //textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  } //end buildButtom

  _buildRadios(BuildContext context) {
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
                    txtDocumento.clear();
                  },
                  activeColor: Colors.black,
                  groupValue: loginController.typePeople,
                ),
                Text("Pessoa Física",
                    style: TextStyle(
                        fontSize: 14,
                        color: loginController.typePeople == TypePeopleState.PF
                            ? Colors.black
                            : Colors.grey)),
              ],
            ),
            Column(
              children: <Widget>[
                Radio(
                  value: TypePeopleState.PJ,
                  activeColor: Colors.black,
                  onChanged: (type) {
                    loginController.changeTypePeople(TypePeopleState.PJ);
                    // tipoPessoa = 'PJ';
                    txtDocumento.clear();
                  },
                  groupValue: loginController.typePeople,
                ),
                Text("Pessoa Jurídica",
                    style: TextStyle(
                        fontSize: 14,
                        color: loginController.typePeople == TypePeopleState.PJ
                            ? Colors.black
                            : Colors.grey))
              ],
            )
          ],
        );
      },
    );
  }

  _buildSeletor() {
    return CupertinoSlidingSegmentedControl(
      padding: EdgeInsets.symmetric(vertical: 8),
      children: {
        0: this._buildSelectorItem(
            this._tipoUsuario == TipoModeEnum.DOADOR, 'Doador'),
        1: this._buildSelectorItem(
            this._tipoUsuario == TipoModeEnum.RECEPTOR, 'Receptor'),
      },
      backgroundColor: Colors.white,
      //thumbColor: Colors.pink,
      onValueChanged: (index) {
        setState(
          () {
            if (index == 0) {
              this._tipoUsuario = TipoModeEnum.DOADOR;
              this._tipoEscolhido = "Doador";
            } else if (index == 1) {
              this._tipoUsuario = TipoModeEnum.RECEPTOR;
              this._tipoEscolhido = "Receptor";
            }
          },
        );
      },
    );
  }

  _buildSelectorItem(bool selecionado, String name) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: selecionado ? Colors.black : Colors.black,
          fontWeight: selecionado ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
        ),
      ),
    );
  }
} //end class

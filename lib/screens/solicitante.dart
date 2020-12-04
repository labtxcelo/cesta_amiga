import 'dart:ui';

import 'package:cesta_amiga/componentes/text_field_componente.dart';
import 'package:cesta_amiga/controllers/auth_controller.dart';
import 'package:cesta_amiga/library/utils/colors_util.dart';
import 'package:cesta_amiga/screens/perfil_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'feed_screen.dart';
import 'login_screen.dart';

class Solicitante extends StatefulWidget {
  @override
  _SolicitanteState createState() => _SolicitanteState();
}

class _SolicitanteState extends State<Solicitante> {
  final authController = GetIt.I<AuthController>();
  final txtDesc = TextEditingController();
  int option = 0;
  String frase =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean consectetur bibendum placerat. Praesent non tortor diam. Donec egestas, urna et hendrerit maximus, purus tortor malesuada nisi, in convallis libero dolor ut nisl. Cras blandit non metus sit amet sollicitudin. Pellentesque malesuada luctus ipsum, in mollis nibh mattis a. Nam ullamcorper aliquet scelerisque. Donec a ex ac elit auctor viverra. Aliquam sagittis finibus nulla ac aliquam. Praesent suscipit urna vitae lorem feugiat venenatis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse eget rutrum nibh.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.fundoCinza,
      appBar: null,
      body: _buildBodyPersonalizada(),
    );
  } //end build

  Widget _buildBodyPersonalizada() {
    return option != 1
        ? Stack(
            children: [
              this._personalizada(),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: this.cabecalho(),
              ),
              this._selecionarCesta(),
            ],
          )
        : Stack(
            children: [
              this._personalizada(),
              Positioned(
                top: 0,
                left: 0,
                child: this.cabecalho(),
              ),
            ],
          );
  } //end _buildBody

  Widget _personalizada() {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(48),
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          color: ColorsUtil.colorHex("135BC3"),
          child: Center(
            child: Text(
              this.frase,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          //height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Center(child: this._buildConteudoCadastro(context)),
        ),
      ],
    );
  } //end _personalizada()

  Widget cabecalho() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("images/icCesta.png", height: 24, width: 24),
          SizedBox(width: 8),
          Observer(
            builder: (_) => Text(
              authController.nomeUsuario != null
                  ? "Olá ${authController.nomeUsuario}, bem vindo!"
                  : "Olá Usuário, bem vindo!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          //Solicitações
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedScreen()),
              );
            },
            child: Text(
              "Feed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          //Meu perfil
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilScreen()),
              );
            },
            child: Text(
              "Meu perfil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          //logout button
          FlatButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  } // end cabecalho

  Widget _buildConteudoCadastro(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 100, 32, 32),
      // height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Text(
            "Maria Conceicao Silva",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 42),
          TextFieldComponente(
            title: "Descrição da solicitação",
            placeholder: "Fale mais sobre sua necessidade",
            inputType: TextInputType.text,
            controller: txtDesc,
            maxLength: 48,
          ),
          SizedBox(height: 42),
          this.itens(),
          this._buildButtom("Solicitar", () {}),
        ],
      ),
    );
  } //end buildConteudoCadastro

  Widget itens() {
    return Container(
      //color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView(
        padding: EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  this.item("Pão"),
                  this.item("Café"),
                  this.item("Óleo"),
                  this.item("Arroz"),
                  this.item("Carne"),
                  this.item("Leite"),
                ],
              ),
              //SizedBox(width: 38),
              Column(
                children: [
                  this.item("Açucar"),
                  this.item("Feijão"),
                  this.item("Banana"),
                  this.item("Batata"),
                  this.item("Tomate"),
                  this.item("Farinha"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget item(String item) {
    int counter = 0;
    return Container(
      width: 120,
      margin: EdgeInsets.only(bottom: 8),
      //color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 20,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (counter > 1) {
                      setState(() {
                        counter--;
                      });
                    }
                  },
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "$counter",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      counter += 1;
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } //end item

  Widget _selecionarCesta() {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            this._card(
              "Personalizada",
              "Aqui você pode personalizar os itens que deseja e sua quantidade unitária!",
              () {
                setState(() {
                  this.option = 1;
                });
              },
            ),
            SizedBox(width: 24),
            this._card(
              "Tradicional",
              "Aqui a cesta tem os itens e quantidade unitária selecionados!",
              () {},
            )
          ],
        ),
      ),
    );
  } //end _selecionarCesta

  Widget _card(String titulo, String texto, Function fn) {
    return InkWell(
      onTap: fn,
      child: Container(
        height: 180,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //height: MediaQuery.of(context).size.height,
              width: 300 * 0.4,
              decoration: BoxDecoration(
                //radius
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                //backGround
                image: DecorationImage(
                  image: AssetImage("images/maca.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.green,
                    margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
                    child: Text(
                      titulo,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.green,
                    margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
                    child: Text(
                      texto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } //end _card

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

} //end class

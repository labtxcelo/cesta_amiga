import 'package:cesta_amiga/controllers/auth_controller.dart';
import 'package:cesta_amiga/library/utils/colors_util.dart';
import 'package:cesta_amiga/screens/feed_screen.dart';
import 'package:cesta_amiga/screens/login_screen.dart';
import 'package:cesta_amiga/screens/minhas_doacoes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final authController = GetIt.I<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.fundoCinza,
      appBar: null,
      body: this._buildBody(),
    );
  }

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
              Navigator.pushReplacement(
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
          //Minhas doações
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MinhasDoacoes()),
              );
            },
            child: Text(
              "Minhas doações",
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

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        this.cabecalho(),
        SizedBox(height: 24),
        this.foto(),
        SizedBox(height: 24),
        this.buildAccountInfo()
      ],
    );
  } //end buildBody()

  Widget buildAccountInfo() {
    return Expanded(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.infoField("Nome", "Bill \& Melinda Gates Foundation"),
              SizedBox(width: 50),
              this.infoField("E-mail", "contato@bmgfoundation.com"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.infoField("CNPJ", "99.999.999/9999-99"),
              SizedBox(width: 50),
              this.infoField("CEP", "30140-100"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.infoField("Estado", "Minas Gerais"),
              SizedBox(width: 50),
              this.infoField("Bairro", "Funcionários"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.infoField("Estado", "Minas Gerais"),
              SizedBox(width: 50),
              this.infoField("Bairro", "Funcionários"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.infoField("Complento", "Dev Tower"),
              SizedBox(width: 50),
              this.infoField("Número", "2000"),
            ],
          ),
        ],
      ),
    );
  }

  Widget foto() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            spreadRadius: 0.2,
            blurRadius: 8,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Icon(
        Icons.person,
        color: Colors.black,
        size: 80,
      ),
    );
  } //end foto

  Widget infoField(String campo, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          campo,
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 0.3,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                spreadRadius: 0.2,
                blurRadius: 8,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  } //infoField

} //end class

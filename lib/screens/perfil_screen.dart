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
    /* Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 125, 141),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ); */
    return Scaffold(
      backgroundColor: ColorsUtil.fundoCinza,
      appBar: null,
      //body: Stack(children: [_buildBodyBack(), this._buildBody()]),
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
              authController.user.usuario.nome != null
                  ? this.infoField("Nome", authController.user.usuario.nome)
                  : this.infoField("Nome", "Não encontrado"),
              SizedBox(width: 50),
              authController.user.usuario.email != null
                  ? this.infoField("Email", authController.user.usuario.email)
                  : this.infoField("Email", "Não encontrado"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              authController.user.usuario.documento != null
                  ? this.infoField(
                      "Documento", authController.user.usuario.documento)
                  : this.infoField("Documento", "Não encontrado"),
              SizedBox(width: 50),
              this.infoField("CEP", "30140-100"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              authController.user.usuario.estado != null
                  ? this.infoField("Estado", authController.user.usuario.estado)
                  : this.infoField("Estado", "Não encontrado"),
              SizedBox(width: 50),
              authController.user.usuario.bairro != null
                  ? this.infoField("Bairro", authController.user.usuario.bairro)
                  : this.infoField("Bairro", "Não encontrado"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              authController.user.usuario.cidade != null
                  ? this.infoField("Cidade", authController.user.usuario.cidade)
                  : this.infoField("Cidade", "Não encontrado"),
              SizedBox(width: 50),
              authController.user.usuario.logradouro != null
                  ? this.infoField(
                      "Logradouro", authController.user.usuario.logradouro)
                  : this.infoField("Logradouro", "Não encontrado"),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              authController.user.usuario.complemento != null
                  ? this.infoField(
                      "Complemento", authController.user.usuario.complemento)
                  : this.infoField("Complemento", "Não encontrado"),
              SizedBox(width: 50),
              authController.user.usuario.numero != null
                  ? this.infoField("Número", authController.user.usuario.numero)
                  : this.infoField("Número", "Não encontrado"),
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

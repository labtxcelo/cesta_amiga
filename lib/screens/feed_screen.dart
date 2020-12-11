import 'package:cesta_amiga/controllers/auth_controller.dart';
import 'package:cesta_amiga/controllers/solicitante_controller.dart';
import 'package:cesta_amiga/library/utils/colors_util.dart';
import 'package:cesta_amiga/models/dto/NecessidadeItemDTO.dart';
import 'package:cesta_amiga/models/objects/Necessidade.dart';
import 'package:cesta_amiga/screens/login_screen.dart';
import 'package:cesta_amiga/screens/minhas_doacoes_screen.dart';
import 'package:cesta_amiga/screens/perfil_screen.dart';
import 'package:cesta_amiga/screens/solicitante_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final authController = GetIt.I<AuthController>();
  SolicitanteController solicitanteController = SolicitanteController();

  @override
  Widget build(BuildContext context) {
    solicitanteController.buscarNecessidades();
    return Scaffold(
      backgroundColor: ColorsUtil.fundoCinza,
      appBar: null,
      body: this._buildBody(),
    );
  } //end build

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
          //Minhas doações
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MinhasDoacoes()),
              );
            },
            child: Text(
              "Minhas Doações",
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

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        this.cabecalho(),
        Expanded(
          child: Observer(builder: (_) {
            return ListView(
                scrollDirection: Axis.horizontal,
                children: solicitanteController.necessidades.where((element) {
                  return element.statusEncerrado != true;
                }).map((necessidade) {
                  return buildPedido(necessidade);
                }).toList());
          }),
        ),
      ],
    );
  } //end _buildBody

  Widget buildPedido(Necessidade necessidade) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.4;
    int totalItens = 0;
    return Container(
      margin: EdgeInsets.all(16),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 0.5,
            blurRadius: 8,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: width * 0.3,
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
            child: Container(
              //color: Colors.green,
              margin: EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.solicitante(necessidade),
                  SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: width,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  this.itens(necessidade),
                  Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 16, right: 8),
                    child: this._buildButtom("Doar", () {
                      solicitanteController.gerarDoacao(necessidade, context);
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } //end buildPedido

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

  Widget solicitante(Necessidade necessidade) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            necessidade.user.usuario.nome,
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 0.3,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ]),
        SizedBox(height: 8),
        Text(
          necessidade.descricao,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget itens(Necessidade necessidade) {
    return Expanded(
        child: ListView(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
            children: necessidade.itens.map((item) {
              return this.item(item);
            }).toList()));
  }

  Widget item(NecessidadeItemDTO necessidadeItem) {
    int counter = 0;
    return Container(
      width: 120,
      margin: EdgeInsets.only(bottom: 16),
      //color: Colors.deepPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                necessidadeItem.item.nome,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                necessidadeItem.item.litro == null
                    ? necessidadeItem.item.peso
                    : necessidadeItem.item.litro,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
              Text(
                "unidades solicitadas: ${necessidadeItem.quantidade}",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          //SizedBox(width: 34),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 8),
          //   height: 35,
          //   width: 62,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(25),
          //     color: Colors.black,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           solicitanteController.subItemDoacao(necessidadeItem);
          //         },
          //         child: Text(
          //           "-",
          //           style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             fontSize: 15,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //       Text(
          //         "${necessidadeItem.item.quantidade ?? 0}",
          //         style: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           fontSize: 13,
          //           color: Colors.white,
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () {
          //           solicitanteController.addItemDoacao(necessidadeItem);
          //         },
          //         child: Text(
          //           "+",
          //           style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             fontSize: 10,
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
} //end class

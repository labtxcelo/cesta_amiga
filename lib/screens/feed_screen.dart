import 'package:cesta_amiga/library/utils/colors_util.dart';
import 'package:cesta_amiga/screens/login_screen.dart';
import 'package:cesta_amiga/screens/minhas_doacoes_screen.dart';
import 'package:cesta_amiga/screens/perfil_screen.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
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
          Text(
            "Olá Usuário, bem vindo!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              this.buildPedido(),
              this.buildPedido(),
              this.buildPedido(),
              this.buildPedido(),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  this.buildPedido(),
                  this.buildPedido(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  this.buildPedido(),
                  this.buildPedido(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  this.buildPedido(),
                  this.buildPedido(),
                ],
              ), */
            ],
          ),
        ),
      ],
    );
  } //end _buildBody

  Widget buildPedido() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.4;
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
                  this.solicitante(),
                  SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: width,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  this.itens(height * 0.5),
                  Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 16, right: 8),
                    child: this._buildButtom("Doar", () {}),
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

  Widget solicitante() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            "Maria Conceição Silva",
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at quam ut nisl dignissim hendrerit sed vel turpis. Aenean commodo sagittis lorem eu maximus. Vivamus vel gravida nisl, ac tincidunt enim.",
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget itens(double height) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
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
          //SizedBox(width: 34),
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
  }
} //end class

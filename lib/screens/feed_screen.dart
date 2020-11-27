import 'package:cesta_amiga/library/utils/colors_util.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: this._appBar(),
      body: this._buildBody(),
    );
  } //end build

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: null,
      automaticallyImplyLeading: false,
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ],
    );
  } //end _appBar

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  this.buildPedido(),
                  this.buildPedido(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  this.buildPedido(),
                  this.buildPedido(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  } //end _buildBody

  Widget buildPedido() {
    double height = MediaQuery.of(context).size.height * 0.4;
    double width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      margin: EdgeInsets.all(16),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(8, 8), // changes position of shadow
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
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              //backGround
              image: DecorationImage(
                image: AssetImage("images/food.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Expanded(
            child: Container(
              //color: Colors.green,
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.solicitante(),
                  SizedBox(height: 8),
                  this.itens(height * 0.5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } //end buildPedido

  Widget solicitante() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Maria Conceição Silva",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce at quam ut nisl dignissim hendrerit sed vel turpis. Aenean commodo sagittis lorem eu maximus. Vivamus vel gravida nisl, ac tincidunt enim.",
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget itens(double height) {
    return Container(
      height: height,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                ],
              ),
              SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
                  this.item("Carne"),
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
      padding: EdgeInsets.only(bottom: 8),
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
          SizedBox(width: 34),
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
                      color: ColorsUtil.colorHex("F4F4F7"),
                    ),
                  ),
                ),
                Text(
                  "$counter",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: ColorsUtil.colorHex("F4F4F7"),
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
                      color: ColorsUtil.colorHex("F4F4F7"),
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

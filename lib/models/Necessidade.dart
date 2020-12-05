import 'package:cesta_amiga/models/Item.dart';
import 'package:cesta_amiga/models/UserAuth.dart';

class Necessidade {
  String descricao;
  int id;
  List<Item> itens;
  bool statusEncerrado;
  UserAuth user;

  Necessidade();

  Necessidade.map(Map<String, dynamic> json) {
    this.descricao = json['descricao'];
    this.id = json['id'];
    this.statusEncerrado = json['statusEncerrado'];
    this.user = json['user'] != null ? new UserAuth.map(json['user']) : null;
    if (json['itens'] != null) {
      this.itens = new List<Item>();
      json['itens'].map((v) {
        itens.add(new Item.map(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['id'] = this.id;
    if (this.itens != null) {
      data['itens'] = this.itens.map((v) => v.toMap()).toList();
    }
    data['statusEncerrado'] = this.statusEncerrado;
    if (this.user != null) {
      data['user'] = this.user.toMap();
    }
    return data;
  }
}

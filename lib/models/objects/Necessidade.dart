import 'package:cesta_amiga/models/dto/NecessidadeItemDTO.dart';
import 'package:cesta_amiga/models/objects/Item.dart';
import 'package:cesta_amiga/models/objects/UserAuth.dart';

class Necessidade {
  String descricao;
  int id;
  List<NecessidadeItemDTO> itens;
  bool statusEncerrado;
  UserAuth user;

  Necessidade();

  Necessidade.map(Map<String, dynamic> json) {
    this.descricao = json['descricao'];
    this.id = json['id'];
    this.statusEncerrado = json['statusEncerrado'];
    this.user = json['user'] != null ? new UserAuth.map(json['user']) : null;
    if (json['itens'] != null) {
      var list = json['itens'] as List;
      this.itens = list.map((e) => NecessidadeItemDTO.map(e)).toList();
    } else {
      this.itens = [];
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

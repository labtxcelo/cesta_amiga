import 'package:cesta_amiga/models/objects/Necessidade.dart';
import 'package:cesta_amiga/models/objects/UserAuth.dart';

class Doacao {
  int id;
  //List<ItensDoacao> itensDoacao;
  Necessidade necessidade;
  UserAuth user;

  Doacao();

  Doacao.map(Map<String, dynamic> json) {
    id = json['id'];
    // if (json['itensDoacao'] != null) {
    // 	itensDoacao = new List<ItensDoacao>();
    // 	json['itensDoacao'].forEach((v) { itensDoacao.add(new ItensDoacao.fromJson(v)); });
    // }
    necessidade = json['necessidade'] != null
        ? new Necessidade.map(json['necessidade'])
        : null;
    user = json['user'] != null ? new UserAuth.map(json['user']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // if (this.itensDoacao != null) {
    //   data['itensDoacao'] = this.itensDoacao.map((v) => v.toJson()).toList();
    // }
    if (this.necessidade != null) {
      data['necessidade'] = this.necessidade.toMap();
    }
    if (this.user != null) {
      data['user'] = this.user.toMap();
    }
    return data;
  }
}

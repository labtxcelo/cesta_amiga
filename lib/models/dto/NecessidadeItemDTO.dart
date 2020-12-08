import 'package:cesta_amiga/models/objects/Item.dart';

class NecessidadeItemDTO {
  int id;
  Item item;
  int quantidade;
  int quantidadeRecebido;

  NecessidadeItemDTO();

  NecessidadeItemDTO.map(Map<String, dynamic> json) {
    this.id = json['id'];
    this.item = json['item'] != null ? new Item.map(json['item']) : null;
    this.quantidade = json['quantidade'];
    this.quantidadeRecebido = json['quantidadeRecebido'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantidade'] = this.quantidade;
    data['quantidadeRecebido'] = this.quantidadeRecebido;
    if (this.item != null) {
      data['item'] = this.item.toMap();
    }
    return data;
  }
}

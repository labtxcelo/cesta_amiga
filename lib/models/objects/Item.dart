class Item {
  int id;
  String litro;
  String nome;
  String peso;
  String tipo;
  dynamic quantidade;

  Item();

  Item.map(Map<String, dynamic> json) {
    this.id = json['id'];
    this.litro = json['litro'];
    this.nome = json['nome'];
    this.peso = json['peso'];
    this.tipo = json['tipo'];
    this.quantidade = json['quantidade'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['litro'] = this.litro;
    data['nome'] = this.nome;
    data['peso'] = this.peso;
    data['tipo'] = this.tipo;
    data['quantidade'] = this.quantidade;
    return data;
  }
}

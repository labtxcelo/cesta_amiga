class Usuario {
  int id;
  String nome;
  String email;
  String password;
  String tipoPessoa;
  String documento;
  String estado;
  String cidade;
  String bairro;
  String logradouro;
  String numero;
  String complemento;
  String tipoUsuario;

  Usuario();

  Usuario.map(Map<String, dynamic> json) {
    this.id = json["id"];
    this.nome = json["nome"];
    this.email = json["email"];
    this.password = json["password"];
    this.tipoPessoa = json["tipoPessoa"];
    this.documento = json["documento"];
    this.estado = json["estado"];
    this.cidade = json["cidade"];
    this.bairro = json["Bairro"];
    this.logradouro = json["logradouro"];
    this.numero = json["numero"];
    this.complemento = json["complemento"];
    this.tipoUsuario = json["tipoUsuario"];
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['nome'] = this.nome;
    map['email'] = this.email;
    map['password'] = this.password;
    map['tipoPessoa'] = this.tipoPessoa;
    map['documento'] = this.documento;
    map['estado'] = this.estado;
    map['cidade'] = this.cidade;
    map['logradouro'] = this.logradouro;
    map['numero'] = this.numero;
    map['complemento'] = this.complemento;
    map['tipoUsuario'] = this.tipoUsuario;
    return map;
  }
}

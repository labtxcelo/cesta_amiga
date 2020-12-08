import 'Usuario.dart';

class UserAuth {
  int id;
  Usuario usuario;
  String nome;
  String email;
  String password;
  String tipoUsuario;

  UserAuth();

  UserAuth.map(Map<String, dynamic> json) {
    this.id = json['id'];
    this.usuario =
        json['usuario'] != null ? Usuario.map(json['usuario']) : null;
    this.nome = json['nome'];
    this.email = json['email'];
    this.password = json['password'];
    this.tipoUsuario = json['tipoUsuario'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['id'] = this.id;
    if (this.usuario != null) {
      map['usuario'] = this.usuario.toMap();
    }
    map['nome'] = this.nome;
    map['email'] = this.email;
    map['password'] = this.password;
    map['tipoUsuario'] = this.tipoUsuario;
    return map;
  }
}

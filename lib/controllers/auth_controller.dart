import 'package:cesta_amiga/library/utils/requests.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  bool usuarioLogado = false;

  timeStamp() async {
    final response =
        await http.get('http://armariosinteligentes.com/api/v3/timestamp');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.

    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @action
  cadastrarUsuario() async {
    var body = {
      "id": 4,
      "nome": "Test-Front",
      "email": "test@test",
      "senha": "test123",
      "tipoPessoa": "PF",
      "documento": "512.334.831-33",
      "estado": "MG",
      "cidade": "BH",
      "logradouro": "Rua Salvia",
      "numero": "201",
      "complemento": "Casa",
      "tipoUsuario": "doador"
    };

    var response = http.get('http://localhost:8080/usuario/listar-todos');

    if (response != null) {
      print('PASSOU: ${response.toString()}');
    } else {
      print('NAO PEGA BROOOO');
    }

    sendRequest
        .request(HttpMethod.GET, 'http://localhost:8080/usuario/listar-todos')
        .then((response) {
      print(body);
      print(response);
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }
}

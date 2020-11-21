import 'dart:async';
import 'dart:convert';
import 'package:cesta_amiga/library/base_store/base_stores.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const bool PRINT_LOG = true;

Requests sendRequest = Requests();

enum HttpMethod { GET, POST, PUT, PATCH, DELETE }

class Requests {
  Dio _dio;
  JsonDecoder _decoder;

  BaseOptions _baseOptions = new BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'http://localhost:8080/',
      //baseUrl: 'http://191.14.88.8:8089/',
      //baseUrl: 'http://179.84.130.232:8089/',
      connectTimeout: 60000,
      receiveTimeout: 30000,
      contentType: 'application/json',
      followRedirects: false);

  /// ==========================================================
  /// Singleton Factory
  ///
  ///
  static final Requests _network = Requests._internal();
  factory Requests() {
    _network.init();
    return _network;
  }
  Requests._internal();

  /// ==========================================================
  /// One-time initialization
  ///
  ///
  init() {
    print('init() Requests');
    if (_dio == null) {
      _dio = Dio(this._baseOptions);
      _decoder = JsonDecoder();
    }
    return null;
  }

  /// ==========================================================
  /// Requests
  ///
  ///

  // _showAlert(String mensagem) {
  //   frwkAlert.showAlert(
  //     message: mensagem,
  //   );
  // }

  // Future<dynamic> multipartFile(String url, File customFile,
  //     {Map headers, encoding}) async {
  //   if (!await this.isConnected()) {
  //     throw new Exception("Verifique sua conexão e tente novamente!");
  //   }
  //   var postUri = Uri.parse(_baseOptions.baseUrl + url);
  //   var request = new http.MultipartRequest('PUT', postUri);
  //   var name = customFile.path.split('/').last;
  //   request.headers['Content-Type'] = 'application/x-www-form-urlencoded';

  //   request.files.add(new http.MultipartFile.fromBytes(
  //       'comprovante', await customFile.readAsBytes(),
  //       filename: name, contentType: new MediaType('image', 'jpeg')));

  //   return request.send().then((response) async {
  //     print("Request (MultipartFile): $url");
  //     print("Response Code: ${response.statusCode}");
  //     if (response.statusCode < 200 || response.statusCode > 204) {
  //       throw new Exception("Erro desconhecido!");
  //     } else {
  //       print("Uploaded!");
  //       return await response.stream.bytesToString();
  //     }
  //   });
  // }

  Future<dynamic> request(HttpMethod method, String endpoint,
      {Map headers, body, bool autoLoading = true}) async {
    if (autoLoading) cestaLoading.startLoading();

    dynamic response;

    try {
      if (method == HttpMethod.GET) {
        response = await this._get(endpoint, headers: headers);
      } else if (method == HttpMethod.POST) {
        response = await this._post(endpoint, body: body, headers: headers);
      } else if (method == HttpMethod.PUT) {
        response = await this._put(endpoint, body: body, headers: headers);
      } else if (method == HttpMethod.PATCH) {
        print('HttpMethod PATCH não implementado!');
      } else if (method == HttpMethod.DELETE) {
        response = await this._delete(endpoint, body: body, headers: headers);
      } else {
        print('HttpMethod desconhecido!');
      }
    } catch (e) {
      print('Request Exception => ($endpoint) $e');

      if (autoLoading) cestaLoading.stopLoading();

      if (e is DioError) {
        var dioError = e;
        String message = dioError?.response?.data['message'];

        if (message == null)
          throw new Exception(
              'Erro desconhecido! Entre em contato com um administrador do sistema.');
        else
          throw new Exception(_getMensagemByKey(message));
      } else {
        throw new Exception(
            'Não foi possível concluir sua chamada! Tente novamente mais tarde.');
      }
    }
    if (autoLoading) cestaLoading.stopLoading();

    return response;
  }

  Future<dynamic> _get(String endpoint, {Map headers}) async {
    if (!await this.isConnected()) {
      throw new Exception('Verifique sua conexão!');
    }

    Response response = await _dio.get(
      endpoint,
      options: await this._getCustomConfig(headers),
    );
    return this._generateResponse(response);
  }

  Future<dynamic> _delete(String endpoint, {Map headers, body}) async {
    if (!await this.isConnected()) {
      throw new Exception('Verifique sua conexão!');
    }

    Response response = await _dio.delete(
      endpoint,
      data: body,
      options: await this._getCustomConfig(headers),
    );
    return this._generateResponse(response);
  }

  Future<dynamic> _post(String endpoint, {Map headers, body}) async {
    if (!await this.isConnected()) {
      print('verifique sua conexão');
      throw new Exception('Verifique sua conexão!');
    }

    Response response = await _dio.post(
      endpoint,
      data: body,
      options: await this._getCustomConfig(headers),
    );

    return this._generateResponse(response);
  }

  Future<dynamic> _put(String endpoint, {Map headers, body}) async {
    if (!await this.isConnected()) {
      throw new Exception('Verifique sua conexão!');
    }

    Response response = await _dio.put(
      endpoint,
      data: body,
      options: await this._getCustomConfig(headers),
    );

    return this._generateResponse(response);
  }

  /// ==========================================================
  /// Custom
  ///

//   Future<bool> getToken({String email, String senha}) async {
//     frwkLoading.startLoading();

//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (email == null || senha == null) {
//       email = prefs.getString("email");
//       senha = prefs.getString("senha");
//     }

//     if (email == null || senha == null) {
//       print('getToken email e senha inválidos');
//       return false;
//     }

//     //String firebaseToken = await FirebaseMessaging().getToken();

//     var body = {
//       'login': email,
//       'password': senha,
//       'tokenFirebase': firebaseToken
//     };
//     return await this
//         ._post('auth', body: body,).then((response) {
//       frwkLoading.stopLoading();
//       if (response != null && response['token'] != null) {
//         prefs.setString('token', response['token']);
//         return true;
//       } else {
//         return false;
//       }
//     }).catchError((error) {
//       print('getToken ERRO: $error');
//       frwkLoading.stopLoading();
//       return false;
// //      if(error is DioError){
// //
// //        var dioError = error;
// //        String message = dioError?.response?.data['message'];
// //
// //        if(message == null){
// //          throw new Exception(
// //            'Erro desconhecido! Entre em contato com um administrador do sitema.'
// //          );
// //        }else{
// //          throw new Exception(
// //            _getMensagemByKey(message)
// //          );
// //        }
// //      }else{
// //        throw new Exception(
// //          'Não foi possível concluir sua chamada! Tente novamente mais tarde.'
// //        );
// //      }
//     });
//   }

  dynamic _generateResponse(Response response) {
    final int statusCode = response.statusCode;

    if (PRINT_LOG) {
      print("Request (${response.request.method}) => ${response.request.path}");
      print("Response ($statusCode) => ${response.data.toString()}");
    }

    final decoded = response.data;

    if (statusCode < 200 || statusCode > 204) {
      print(decoded);
      if (decoded != null && decoded["data"] != null) {
        throw new Exception(decoded["data"]);
      }
      throw new Exception(
          'Não foi possível concluir sua chamada! Tente novamente mais tarde.');
    }

    print(decoded is List);

    if (decoded is List) {
      return decoded;
    } else if (decoded["data"] == null) {
      return decoded;
    } else {
      return decoded["data"];
    }
  }

  Future<Options> _getCustomConfig(Map<String, String> customHeader) async {
    Options options = Options();
    options.followRedirects = false;

    options.headers = await this._getDefaultHeader(customHeader);
    return options;
  }

  Future<Map<String, String>> _getDefaultHeader(
      Map<String, String> customHeader) async {
    if (customHeader != null) {
      return customHeader;
    }

    Map<String, String> header = {"Content-Type": "application/json"};
    if (customHeader != null) {
      header.addAll(customHeader);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      header['Authorization'] = prefs.getString('token');
    }

    return header;
  }

  /// ==========================================================
  /// Extras
  ///

  String _getMensagemByKey(String key) {
    if (key == 'UserExistsException') {
      return 'E-mail já cadastrado!';
    } else if (key == 'UserNotFoundException') {
      return 'Usuário ou senha incorretos!';
    } else if (key == 'WrongPasswordException') {
      return 'Senha incorreta!';
    } else if (key == 'UserDisableException') {
      return 'Usuário desabilitado!';
    } else if (key == 'InputRegistraGatewayException') {
      return 'Favor verificar o correto preenchimento dos campos obrigatórios.';
    } else if (key == 'RegistraGatewayException') {
      return 'Não foi possível confirmar sua reserva de voo. Favor tentar novamente mais tarde.';
    } else if (key == 'CancelarPagtoClienteGatewayException') {
      return 'Não foi possível realizar o cancelamento, tente novamente mais tarde!';
    } else if (key == 'TrocaMeioPagtoNaoPermitidoException') {
      return 'O meio de pagamento desta compra já foi alterado!';
    } else if (key == 'CupomExpiradoException') {
      return 'Lamentamos informar que o Cupom inserido expirou.';
    } else if (key == 'CupomInexistenteException') {
      return 'O Cupom inserido não existe!';
    } else if (key == 'CupomUtilizadoException') {
      return 'O Cupom inserido já foi aplicado anteriormente.';
    } else if (key == 'NumberVersionException') {
      return 'Não foi possível identificar o número de sua versão. Por favor verifique se seu aplicativo está atualizado!';
    } else if (key == 'CapturaPagtoGatewayException') {
      return 'Não foi possível confirmar sua reserva de voo. Entre em contato com sua operadora de crédito.';
    } else if (key == 'AssentosInsuficientesExcpeition') {
      return 'Desculpe, esta intenção não possui mais a quatidade de assentos desejada.';
    } else if (key == 'Expectation Failed') {
      return 'Desculpe, acabamos de vender todos os assentos desta intenção.';
    } else if (key == 'UserAuthNullException') {
      return 'É necessário estar logado para conseguir completar esta requisição.';
    } else if (key.isEmpty == false) {
      print('A CHAVE NÃO TRATADA É: $key');
      return 'Não foi possível concluir sua requisição, tente novamente mais tarde!';
    } else {
      return 'Não foi possível concluir sua requisição, tente novamente mais tarde!';
    }
  }

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}

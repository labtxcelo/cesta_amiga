// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$usuarioLogadoAtom = Atom(name: '_AuthControllerBase.usuarioLogado');

  @override
  bool get usuarioLogado {
    _$usuarioLogadoAtom.reportRead();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(bool value) {
    _$usuarioLogadoAtom.reportWrite(value, super.usuarioLogado, () {
      super.usuarioLogado = value;
    });
  }

  final _$nomeUsuarioAtom = Atom(name: '_AuthControllerBase.nomeUsuario');

  @override
  String get nomeUsuario {
    _$nomeUsuarioAtom.reportRead();
    return super.nomeUsuario;
  }

  @override
  set nomeUsuario(String value) {
    _$nomeUsuarioAtom.reportWrite(value, super.nomeUsuario, () {
      super.nomeUsuario = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  UserAuth get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserAuth value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$cadastrarUsuarioAsyncAction =
      AsyncAction('_AuthControllerBase.cadastrarUsuario');

  @override
  Future cadastrarUsuario(dynamic body, BuildContext context) {
    return _$cadastrarUsuarioAsyncAction
        .run(() => super.cadastrarUsuario(body, context));
  }

  final _$loginAsyncAction = AsyncAction('_AuthControllerBase.login');

  @override
  Future login(String email, String password, BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(email, password, context));
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic deslogar() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.deslogar');
    try {
      return super.deslogar();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarioLogado: ${usuarioLogado},
nomeUsuario: ${nomeUsuario},
user: ${user}
    ''';
  }
}

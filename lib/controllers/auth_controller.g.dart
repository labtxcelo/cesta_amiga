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

  final _$cadastrarUsuarioAsyncAction =
      AsyncAction('_AuthControllerBase.cadastrarUsuario');

  @override
  Future cadastrarUsuario(dynamic body) {
    return _$cadastrarUsuarioAsyncAction
        .run(() => super.cadastrarUsuario(body));
  }

  final _$loginAsyncAction = AsyncAction('_AuthControllerBase.login');

  @override
  Future login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
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
usuarioLogado: ${usuarioLogado}
    ''';
  }
}

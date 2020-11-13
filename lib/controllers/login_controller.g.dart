// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$cadastroAtom = Atom(name: '_LoginControllerBase.cadastro');

  @override
  bool get cadastro {
    _$cadastroAtom.reportRead();
    return super.cadastro;
  }

  @override
  set cadastro(bool value) {
    _$cadastroAtom.reportWrite(value, super.cadastro, () {
      super.cadastro = value;
    });
  }

  final _$typePeopleAtom = Atom(name: '_LoginControllerBase.typePeople');

  @override
  TypePeopleState get typePeople {
    _$typePeopleAtom.reportRead();
    return super.typePeople;
  }

  @override
  set typePeople(TypePeopleState value) {
    _$typePeopleAtom.reportWrite(value, super.typePeople, () {
      super.typePeople = value;
    });
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic changeCadastro(bool flag) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeCadastro');
    try {
      return super.changeCadastro(flag);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTypePeople(TypePeopleState type) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeTypePeople');
    try {
      return super.changeTypePeople(type);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cadastro: ${cadastro},
typePeople: ${typePeople}
    ''';
  }
}

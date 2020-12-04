// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitante_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SolicitanteController on _SolicitanteControllerBase, Store {
  final _$itensAtom = Atom(name: '_SolicitanteControllerBase.itens');

  @override
  List<Item> get itens {
    _$itensAtom.reportRead();
    return super.itens;
  }

  @override
  set itens(List<Item> value) {
    _$itensAtom.reportWrite(value, super.itens, () {
      super.itens = value;
    });
  }

  final _$buscarItensAsyncAction =
      AsyncAction('_SolicitanteControllerBase.buscarItens');

  @override
  Future buscarItens() {
    return _$buscarItensAsyncAction.run(() => super.buscarItens());
  }

  @override
  String toString() {
    return '''
itens: ${itens}
    ''';
  }
}

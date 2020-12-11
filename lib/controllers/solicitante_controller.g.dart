// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitante_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SolicitanteController on _SolicitanteControllerBase, Store {
  final _$itensNecessidadeAtom =
      Atom(name: '_SolicitanteControllerBase.itensNecessidade');

  @override
  List<NecessidadeItemDTO> get itensNecessidade {
    _$itensNecessidadeAtom.reportRead();
    return super.itensNecessidade;
  }

  @override
  set itensNecessidade(List<NecessidadeItemDTO> value) {
    _$itensNecessidadeAtom.reportWrite(value, super.itensNecessidade, () {
      super.itensNecessidade = value;
    });
  }

  final _$necessidadeAtom =
      Atom(name: '_SolicitanteControllerBase.necessidade');

  @override
  Necessidade get necessidade {
    _$necessidadeAtom.reportRead();
    return super.necessidade;
  }

  @override
  set necessidade(Necessidade value) {
    _$necessidadeAtom.reportWrite(value, super.necessidade, () {
      super.necessidade = value;
    });
  }

  final _$necessidadeItemDTOAtom =
      Atom(name: '_SolicitanteControllerBase.necessidadeItemDTO');

  @override
  NecessidadeItemDTO get necessidadeItemDTO {
    _$necessidadeItemDTOAtom.reportRead();
    return super.necessidadeItemDTO;
  }

  @override
  set necessidadeItemDTO(NecessidadeItemDTO value) {
    _$necessidadeItemDTOAtom.reportWrite(value, super.necessidadeItemDTO, () {
      super.necessidadeItemDTO = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_SolicitanteControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

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

  final _$necessidadesAtom =
      Atom(name: '_SolicitanteControllerBase.necessidades');

  @override
  List<Necessidade> get necessidades {
    _$necessidadesAtom.reportRead();
    return super.necessidades;
  }

  @override
  set necessidades(List<Necessidade> value) {
    _$necessidadesAtom.reportWrite(value, super.necessidades, () {
      super.necessidades = value;
    });
  }

  final _$buscarItensAsyncAction =
      AsyncAction('_SolicitanteControllerBase.buscarItens');

  @override
  Future buscarItens() {
    return _$buscarItensAsyncAction.run(() => super.buscarItens());
  }

  final _$buscarNecessidadesAsyncAction =
      AsyncAction('_SolicitanteControllerBase.buscarNecessidades');

  @override
  Future buscarNecessidades() {
    return _$buscarNecessidadesAsyncAction
        .run(() => super.buscarNecessidades());
  }

  final _$_SolicitanteControllerBaseActionController =
      ActionController(name: '_SolicitanteControllerBase');

  @override
  dynamic includeText(String text) {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.includeText');
    try {
      return super.includeText(text);
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic montaNecessidade() {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.montaNecessidade');
    try {
      return super.montaNecessidade();
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic gerarSolicitacao(Necessidade necessidade) {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.gerarSolicitacao');
    try {
      return super.gerarSolicitacao(necessidade);
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addQuantidade(Item item) {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.addQuantidade');
    try {
      return super.addQuantidade(item);
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic subQuantidade(Item item) {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.subQuantidade');
    try {
      return super.subQuantidade(item);
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItemDoacao(NecessidadeItemDTO necessidadeItem) {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.addItemDoacao');
    try {
      return super.addItemDoacao(necessidadeItem);
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic subItemDoacao(NecessidadeItemDTO necessidadeItem) {
    final _$actionInfo = _$_SolicitanteControllerBaseActionController
        .startAction(name: '_SolicitanteControllerBase.subItemDoacao');
    try {
      return super.subItemDoacao(necessidadeItem);
    } finally {
      _$_SolicitanteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itensNecessidade: ${itensNecessidade},
necessidade: ${necessidade},
necessidadeItemDTO: ${necessidadeItemDTO},
descricao: ${descricao},
itens: ${itens},
necessidades: ${necessidades}
    ''';
  }
}

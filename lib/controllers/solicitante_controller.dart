import 'package:cesta_amiga/library/utils/requests.dart';
import 'package:cesta_amiga/models/dto/NecessidadeItemDTO.dart';
import 'package:cesta_amiga/models/objects/Doacao.dart';
import 'package:cesta_amiga/models/objects/Item.dart';
import 'package:cesta_amiga/models/objects/Necessidade.dart';
import 'package:cesta_amiga/screens/minhas_doacoes_screen.dart';
import 'package:cesta_amiga/screens/minhas_solicitacoes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'auth_controller.dart';
part 'solicitante_controller.g.dart';

class SolicitanteController = _SolicitanteControllerBase
    with _$SolicitanteController;

abstract class _SolicitanteControllerBase with Store {
  final authController = GetIt.I<AuthController>();

  @observable
  List<NecessidadeItemDTO> itensNecessidade = [];

  @observable
  Necessidade necessidade = Necessidade();

  @observable
  NecessidadeItemDTO necessidadeItemDTO = NecessidadeItemDTO();

  @observable
  String descricao = "sem descrição";

  @observable
  List<Item> itens = [];

  @observable
  List<Necessidade> necessidades = [];

  @observable
  List<Necessidade> minhasNecessidades = [];

  @observable
  List<Doacao> minhasDoacoes = [];

  @action
  includeText(String text) {
    this.descricao = text;
  }

  @action
  montaNecessidade(BuildContext context) {
    this.necessidade.itens = [];
    for (int i = 0; i < itens.length; i++) {
      if (itens[i].quantidade != null && itens[i].quantidade > 0) {
        var necessidadeItem = NecessidadeItemDTO();
        necessidadeItem.item = itens[i];
        necessidadeItem.quantidade = itens[i].quantidade;
        necessidadeItem.quantidadeRecebido = 0;
        print(necessidadeItem.toMap());
        this.necessidade.itens.add(necessidadeItem);
        print("LISTA => ${this.necessidade.itens.asMap()}");
      }
    }
    this.necessidade.user = authController.user;
    this.necessidade.descricao = this.descricao;
    this.necessidade.statusEncerrado = false;
    print(this.necessidade.toMap());
    gerarSolicitacao(this.necessidade, context);
  }

  @action
  gerarSolicitacao(Necessidade necessidade, BuildContext context) {
    var body = {
      "user": {
        "id": necessidade.user.id,
        "usuario": {
          "id": necessidade.user.usuario.id,
          "nome": necessidade.user.usuario.nome,
          "email": necessidade.user.usuario.email,
          "tipoPessoa": necessidade.user.usuario.tipoPessoa,
          "documento": necessidade.user.usuario.documento,
          "cep": necessidade.user.usuario.cep,
          "estado": necessidade.user.usuario.estado,
          "cidade": necessidade.user.usuario.cidade,
          "bairro": necessidade.user.usuario.bairro,
          "logradouro": necessidade.user.usuario.logradouro,
          "numero": necessidade.user.usuario.numero,
          "complemento": necessidade.user.usuario.complemento,
          "tipoUsuario": necessidade.user.usuario.tipoUsuario
        },
        "nome": necessidade.user.nome,
        "email": necessidade.user.email,
        "tipoUsuario": necessidade.user.tipoUsuario
      },
      "itens": necessidade.itens.map((necessidadeItem) {
        return {
          "item": {
            "id": necessidadeItem.item.id,
            "nome": necessidadeItem.item.nome,
            "litro": necessidadeItem.item.litro,
            "peso": necessidadeItem.item.peso,
            "tipo": necessidadeItem.item.tipo
          },
          "quantidade": necessidadeItem.quantidade,
          "quantidadeRecebido": 0
        };
      }).toList(),
      "descricao": necessidade.descricao,
      "statusEncerrado": false
    };
    print(body);
    sendRequest
        .request(HttpMethod.POST, "necessidade/criar", body: body)
        .then((response) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MinhasSolicitacoesScreen()),
      );
      print(response);
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }

  @action
  addQuantidade(Item item) {
    if (item.quantidade == null) {
      item.quantidade = 1;
    } else {
      item.quantidade++;
    }
    var temp = itens;
    this.itens = temp;
  }

  @action
  subQuantidade(Item item) {
    if (item.quantidade != 0) {
      item.quantidade--;
    }
    var temp = itens;
    this.itens = temp;
  }

  @action
  buscarItens() async {
    sendRequest.request(HttpMethod.GET, "item/listar-todos").then((response) {
      print(response);
      var listItens = response as List;
      this.itens = listItens.map((item) => Item.map(item)).toList();
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }

  @action
  addItemDoacao(NecessidadeItemDTO necessidadeItem) {
    if (necessidadeItem.item.quantidade == null) {
      necessidadeItem.item.quantidade = 1;
    } else {
      if (necessidadeItem.item.quantidade != necessidadeItem.quantidade) {
        necessidadeItem.item.quantidade++;
      }
    }
    var temp = necessidades;
    this.necessidades = temp;
  }

  @action
  subItemDoacao(NecessidadeItemDTO necessidadeItem) {
    if (necessidadeItem.item.quantidade != 0) {
      necessidadeItem.item.quantidade--;
    }
    var temp = necessidades;
    this.necessidades = temp;
  }

  @action
  buscarNecessidades() async {
    sendRequest
        .request(HttpMethod.GET, "necessidade/listar-todos")
        .then((response) {
      print(response);
      var listNecessidades = response as List;
      this.necessidades = listNecessidades
          .map((necessidade) => Necessidade.map(necessidade))
          .toList();
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }

  @action
  buscarMinhasNecessidades(int userId) async {
    sendRequest
        .request(HttpMethod.GET, "necessidade/listar-todos/$userId")
        .then((response) {
      print(response);
      var listNecessidades = response as List;
      this.minhasNecessidades = listNecessidades
          .map((necessidade) => Necessidade.map(necessidade))
          .toList();
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }

  @action
  buscarMinhasDoacoes(int userId) async {
    sendRequest
        .request(HttpMethod.GET, "doacao/listar-todos/$userId")
        .then((response) {
      print(response);
      var listDoacoes = response as List;
      this.minhasDoacoes =
          listDoacoes.map((doacoes) => Doacao.map(doacoes)).toList();
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }

  @action
  gerarDoacao(Necessidade necessidade, BuildContext context) {
    var body = {
      "necessidade": {
        "user": {
          "id": necessidade.user.id,
          "usuario": {
            "id": necessidade.user.usuario.id,
            "nome": necessidade.user.usuario.nome,
            "email": necessidade.user.usuario.email,
            "tipoPessoa": necessidade.user.usuario.tipoPessoa,
            "documento": necessidade.user.usuario.documento,
            "cep": necessidade.user.usuario.cep,
            "estado": necessidade.user.usuario.estado,
            "cidade": necessidade.user.usuario.cidade,
            "bairro": necessidade.user.usuario.bairro,
            "logradouro": necessidade.user.usuario.logradouro,
            "numero": necessidade.user.usuario.numero,
            "complemento": necessidade.user.usuario.complemento,
            "tipoUsuario": necessidade.user.usuario.tipoUsuario
          },
          "nome": necessidade.user.nome,
          "email": necessidade.user.email,
          "tipoUsuario": necessidade.user.tipoUsuario
        },
        "itens": necessidade.itens.map((necessidadeItem) {
          return {
            "item": {
              "id": necessidadeItem.item.id,
              "nome": necessidadeItem.item.nome,
              "litro": necessidadeItem.item.litro,
              "peso": necessidadeItem.item.peso,
              "tipo": necessidadeItem.item.tipo
            },
            "quantidade": necessidadeItem.quantidade,
            "quantidadeRecebido": 0
          };
        }).toList(),
        "descricao": necessidade.descricao,
        "statusEncerrado": necessidade.statusEncerrado
      },
      "user": {
        "id": authController.user.id,
        "usuario": {
          "id": authController.user.usuario.id,
          "nome": authController.user.usuario.nome,
          "email": authController.user.usuario.email,
          "tipoPessoa": authController.user.usuario.tipoPessoa,
          "documento": authController.user.usuario.documento,
          "cep": authController.user.usuario.cep,
          "estado": authController.user.usuario.estado,
          "cidade": authController.user.usuario.cidade,
          "bairro": authController.user.usuario.bairro,
          "logradouro": authController.user.usuario.logradouro,
          "numero": authController.user.usuario.numero,
          "complemento": authController.user.usuario.complemento,
          "tipoUsuario": authController.user.usuario.tipoUsuario
        },
        "nome": authController.user.nome,
        "email": authController.user.email,
        "tipoUsuario": authController.user.tipoUsuario,
      }
    };
    print(body);
    sendRequest
        .request(HttpMethod.POST, "doacao/doar", body: body)
        .then((response) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MinhasDoacoes()),
      );
      print(response);
    }).catchError((onError) {
      print('Algo deu errado!');
      print(onError);
    });
  }
}

import 'package:cesta_amiga/library/utils/requests.dart';
import 'package:cesta_amiga/models/dto/NecessidadeItemDTO.dart';
import 'package:cesta_amiga/models/objects/Item.dart';
import 'package:cesta_amiga/models/objects/Necessidade.dart';
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
  Necessidade necessidade;

  @observable
  NecessidadeItemDTO necessidadeItemDTO;

  @observable
  String descricao = "sem descrição";

  @observable
  List<Item> itens = [];

  @observable
  List<Necessidade> necessidades = [];

  @action
  includeText(String text) {
    this.descricao = text;
  }

  @action
  montaNecessidade() {
    for (int i = 0; i < itens.length; i++) {
      if (itens[i].quantidade > 0) {
        this.necessidadeItemDTO.item = itens[i];
        this.necessidadeItemDTO.quantidade = itens[i].quantidade;
        this.necessidadeItemDTO.quantidadeRecebido = 0;
        this.necessidade.itens.add(this.necessidadeItemDTO);
      }
      this.necessidade.user = authController.user;
      this.necessidade.descricao = this.descricao;
    }
    print(this.necessidade);
  }

  @action
  addQuantidade(Item item) {
    if (item.quantidade == null) {
      item.quantidade = 0;
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
}

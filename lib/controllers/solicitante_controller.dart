import 'package:cesta_amiga/library/utils/requests.dart';
import 'package:cesta_amiga/models/Item.dart';
import 'package:cesta_amiga/models/Necessidade.dart';
import 'package:mobx/mobx.dart';
part 'solicitante_controller.g.dart';

class SolicitanteController = _SolicitanteControllerBase
    with _$SolicitanteController;

abstract class _SolicitanteControllerBase with Store {
  @observable
  List<Item> itens = [];

  @observable
  List<Necessidade> necessidades = [];

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

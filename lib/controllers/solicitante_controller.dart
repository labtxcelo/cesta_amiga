import 'package:cesta_amiga/library/utils/requests.dart';
import 'package:cesta_amiga/models/Item.dart';
import 'package:mobx/mobx.dart';
part 'solicitante_controller.g.dart';

class SolicitanteController = _SolicitanteControllerBase
    with _$SolicitanteController;

abstract class _SolicitanteControllerBase with Store {
  @observable
  List<Item> itens = [];

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
}

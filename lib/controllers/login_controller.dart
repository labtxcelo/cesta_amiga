import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

enum TypePeopleState { PF, PJ }

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool cadastro = false;

  @observable
  TypePeopleState typePeople = TypePeopleState.PF;

  @action
  changeCadastro(bool flag) {
    this.cadastro = flag;
    bool aux = this.cadastro;
    this.cadastro = aux;
  }

  @action
  changeTypePeople(TypePeopleState type) {
    this.typePeople = type;
  }
}

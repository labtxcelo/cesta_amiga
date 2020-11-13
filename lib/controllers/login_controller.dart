import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool cadastro = false;

  @action
  changeCadastro(bool flag) {
    this.cadastro = flag;
    bool aux = this.cadastro;
    this.cadastro = aux;
  }
}

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'navigator_store.g.dart';

class NavigatorStore = _NavigatorStore with _$NavigatorStore;

abstract class _NavigatorStore with Store {
  GlobalKey<NavigatorState> _navigatorKey;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @action
  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    this._navigatorKey = navigatorKey;
  }

  @action
  void navigate(dynamic destination,
      {bool modal, bool replace, bool maintainState}) {
    if (replace != null && replace == true) {
      this._navigatorKey.currentState.pushReplacement(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true),
          );
    } else {
      this._navigatorKey.currentState.push(
            MaterialPageRoute(
                builder: (context) => destination,
                fullscreenDialog: modal ?? false,
                maintainState: maintainState ?? true),
          );
    }
  }

  @action
  popNavigate() {
    if (this._navigatorKey.currentState.canPop()) {
      this._navigatorKey.currentState.pop();
    }
  }

  @action
  popToRoot() {
    if (this._navigatorKey.currentState.canPop()) {
      this
          ._navigatorKey
          .currentState
          .popUntil((Route<dynamic> route) => route.isFirst);
    }
  }
}

import 'package:cesta_amiga/library/base_store/base_stores.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'loading_store.g.dart';

class LoadingStore = _LoadingStore with _$LoadingStore;

abstract class _LoadingStore with Store {
  @observable
  bool isLoading = false;

  @action
  void startLoading() {
    print('startLoading');
    FocusScope.of(cestaNavigator.navigatorKey.currentState.overlay.context)
        .unfocus();
    Future.delayed(Duration(microseconds: 50), () {
      this.isLoading = true;
    });
  }

  @action
  void stopLoading() {
    print('stopLoading');
    Future.delayed(Duration(microseconds: 50), () {
      this.isLoading = false;
    });
  }
}

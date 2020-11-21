// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigatorStore on _NavigatorStore, Store {
  final _$_NavigatorStoreActionController =
      ActionController(name: '_NavigatorStore');

  @override
  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    final _$actionInfo = _$_NavigatorStoreActionController.startAction(
        name: '_NavigatorStore.setNavigatorKey');
    try {
      return super.setNavigatorKey(navigatorKey);
    } finally {
      _$_NavigatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigate(dynamic destination,
      {bool modal, bool replace, bool maintainState}) {
    final _$actionInfo = _$_NavigatorStoreActionController.startAction(
        name: '_NavigatorStore.navigate');
    try {
      return super.navigate(destination,
          modal: modal, replace: replace, maintainState: maintainState);
    } finally {
      _$_NavigatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic popNavigate() {
    final _$actionInfo = _$_NavigatorStoreActionController.startAction(
        name: '_NavigatorStore.popNavigate');
    try {
      return super.popNavigate();
    } finally {
      _$_NavigatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic popToRoot() {
    final _$actionInfo = _$_NavigatorStoreActionController.startAction(
        name: '_NavigatorStore.popToRoot');
    try {
      return super.popToRoot();
    } finally {
      _$_NavigatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

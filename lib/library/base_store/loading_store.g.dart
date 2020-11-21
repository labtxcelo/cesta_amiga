// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadingStore on _LoadingStore, Store {
  final _$isLoadingAtom = Atom(name: '_LoadingStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_LoadingStoreActionController =
      ActionController(name: '_LoadingStore');

  @override
  void startLoading() {
    final _$actionInfo = _$_LoadingStoreActionController.startAction(
        name: '_LoadingStore.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_LoadingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_LoadingStoreActionController.startAction(
        name: '_LoadingStore.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_LoadingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}

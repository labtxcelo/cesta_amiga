// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic checkAuth() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.checkAuth');
    try {
      return super.checkAuth();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signOut() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.signOut');
    try {
      return super.signOut();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signIn(dynamic email, dynamic password) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.signIn');
    try {
      return super.signIn(email, password);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}

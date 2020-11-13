import 'dart:html';

import 'package:cesta_amiga/screens/feed_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../screens/login_screen.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @action
  checkAuth() {
    StreamBuilder(
      stream: FirebaseAuthWeb.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FeedScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  @action
  signOut() {
    FirebaseAuthWeb.instance.signOut();
  }

  @action
  signIn(email, password) {
    FirebaseAuthWeb.instance
        .signInWithEmailAndPassword(email, password)
        .then((user) {
      print("Logado ${email}");
    }).catchError((onError) {
      print(onError);
    });
  }

  @action
  register(email, password) {
    FirebaseAuthWeb.instance
        .createUserWithEmailAndPassword(email, password)
        .then((user) {})
        .catchError((onError) {});
  }
}

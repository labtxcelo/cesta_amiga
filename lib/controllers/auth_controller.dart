import 'package:cesta_amiga/screens/feed_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../screens/login_screen.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebase(FirebaseUser user) {
  //   return user;
  // }

  @action
  checkAuth() {
    StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
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
    _auth.signOut();
  }

  @action
  signIn(email, password) {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print("Logado ${email}");
    }).catchError((onError) {
      print(onError);
    });
  }

  @action
  register(
      {@required Map<String, dynamic> userData, @required String password}) {
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: password)
        .then((user) {})
        .catchError((onError) {});
  }
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

class UserData {
  String userName;
  String email;
  String uid;
  String password;

  UserData({this.userName, this.email, this.uid, this.password});
}

class UserAuth {
  String statusMsg = "Account Created Successfully";

  //To create new User
  Future<String> createUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return statusMsg;
  }

  Future<bool> resetUserPassword(String email) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
  }

  //To verify new User
  Future<String> verifyUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return 'Login Successful';
  }

  Future<String> forgotPassword(String email) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return "Email Sent";
  }

  Future<Null> getUser() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    Future<FirebaseUser> user = firebaseAuth.currentUser();
    user.then((FirebaseUser firebaseUser) {
      firebaseUser.uid;
    });
  }
}


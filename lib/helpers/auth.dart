import 'package:firebase_auth/firebase_auth.dart';
import 'package:weabook/helpers/http_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signin(String email, String password, String username) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await firestore.collection('users').doc(userCredential.user.uid).set({
      "email" : email,
      "username" : username,
      "points" : 0,
      "currentlyWatch" : null,
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> login(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw (HttpException("User Not Found"));
    } else if (e.code == 'wrong-password') {
      throw HttpException('Wrong Password');
    }
  }
}

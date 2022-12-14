import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LRController extends GetxController {
  Future<String> createAccount(String email, String password) async {
    var firebaseauth = FirebaseAuth.instance;
    String msg = "";

    try {
      await firebaseauth.createUserWithEmailAndPassword(
          email: email, password: password);
      msg = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "Week-password") {
        msg = "Password is too short";
      } else if (e.code == "email-in-already-use") {
        msg = "You are in already registered";
      }
    }
    return msg;
  }
  Future<String> loginUser(String email, String password) async {
    String msg = "";
    var firebaseAuth = FirebaseAuth.instance;
    try {
      var res = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      msg = "You are login Successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == "User-Not-Found") {
        msg = "No user found for that email";
      } else if (e.code == "Wrong-password") {
        msg = "wrong password provided for that user";
      }
    }
    return msg;
  }


  bool checkUser() {
    var firebaseAuth = FirebaseAuth.instance;
    var user = firebaseAuth.currentUser;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  void signOut() async {
    var firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut();
    GoogleSignIn().signOut();
  }

  void googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? user =
        await googleSignInAccount!.authentication;
    var crd = GoogleAuthProvider.credential(
      idToken: user.idToken,
      accessToken: user.accessToken,
    );
    var firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signInWithCredential(crd);
  }

}

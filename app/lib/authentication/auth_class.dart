import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static User? currentUser;

  static getCurrentUser() {
    return currentUser;
  }

  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar("Oooppss!",
              'The account already exists with a different credential',
              colorText: Colors.white, backgroundColor: Colors.red);
        } else if (e.code == 'invalid-credential') {
          Get.snackbar("Oooppss!",
              'Error occurred while accessing credentials. Try again.',
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } catch (e) {
        Get.snackbar(
            "Oooppss!", 'Error occurred using Google Sign-In. Try again.',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }

    currentUser = user;

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Get.snackbar(
        'Oooppss!',
        'Error signing out. Try again.',
      );
    }

    currentUser = null;
  }
}

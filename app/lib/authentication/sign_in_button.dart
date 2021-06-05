import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:susya/camera/camera_page.dart';
import 'package:susya/pages/user_page.dart';
import 'package:susya/widgets/login_button.dart';

import 'auth_class.dart';

class SignInButton extends StatefulWidget {
  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  var _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Authentication.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error initializing Firebase');
          } else if (snapshot.connectionState == ConnectionState.done) {
            return LoginButton(
                title: "Login",
                onTap: () async {
                  setState(() {
                    _isSigningIn = true;
                  });

                  User? user =
                      await Authentication.signInWithGoogle(context: context);

                  setState(() {
                    _isSigningIn = false;
                  });

                  if (user != null) {
                    Get.off(() => UserInfoScreen(user: user));
                  }
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:susya/authentication/sign_in_button.dart';
import 'package:susya/services/notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
  // final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  // _fcm.subscribeToTopic("susya");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationHandler(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 4),
                  Image.asset(
                    "assets/logo.png",
                    height: 125,
                  ),
                  Text("SUSya",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  Spacer(flex: 1),
                  // LoginButton(
                  //   title: "Login",
                  //   onTap: () => Get.to(() => CameraPage()),
                  // ),
                  SignInButton(),
                  Spacer(flex: 6)
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

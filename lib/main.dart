import 'package:aesapp/static/themes.dart';
import 'package:aesapp/ui/TestPage.dart';
import 'package:aesapp/ui/page_selector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'dart:io';
import 'package:flutter_web_plugins/url_strategy.dart';

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
void main() async {
  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  // init firebase
  if(kIsWeb||Platform.isIOS||Platform.isAndroid||Platform.isMacOS){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

}


  runApp(const AESApp());
}

class AESApp extends StatelessWidget {
  const AESApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: DarkDashTheme().toSwatchScheme(),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: "/", page: ()=>PageSelector()),
        GetPage(name: "/test", page: ()=>TestPage(),)
      ],
    );
  }
}

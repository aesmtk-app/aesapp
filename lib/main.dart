import 'package:aesapp/static/themes.dart';
import 'package:aesapp/ui/TestPage.dart';
import 'package:aesapp/ui/page_selector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
import 'dart:io';
import 'package:flutter_web_plugins/url_strategy.dart';
final Logger logger = Logger("main");
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
  Logger.root.level = Level.FINEST; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print(
          '${record.loggerName}: ${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  // init firebase
  if(kIsWeb||Platform.isIOS||Platform.isAndroid||Platform.isMacOS){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // init supabase
  await Supabase.initialize(
    url: "http://192.168.178.165:8000",
    debug: true,
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE",
  ).then((value)async {

    final supabase = Supabase.instance.client;
    print(await supabase.from("vplan_entries").select().csv());
  });


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

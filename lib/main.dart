import 'package:aesapp/database/database.dart';
import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/objects/vplan.dart';
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
    url: "https://supabase.aws1313.de",
    debug: true,
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNjkzNzc4NDAwLAogICJleHAiOiAxODUxNjMxMjAwCn0.u3gLP7HKsvFeROPdSOb2hsjRCrPOwaYOUOsp8KRZ30k",
  ).then((value)async {

    final supabase = Supabase.instance.client;
    print(await supabase.from("vplan_entries").select().csv());
  });
  final supabase = Supabase.instance.client;
  supabase.from("vplan_entries").stream(primaryKey: ["date",
      "is_info",
      "course",
      "subject_new",
      "lesson_start",
      "lesson_end",
    "subject_old"
  ]).listen((List<Map<String,dynamic>>event) {
    for (Map<String,dynamic> m in event){
      print(VPlanEntries.fromSupabase(m));
    }
    });
  final res = await supabase.functions.invoke("hello", body: {"name":"test"});
  print(res.data);

  // set services
  Get.put(Database());
  Get.put(DarkDashTheme() as AESTheme);

  runApp(const AESApp());
}

class AESApp extends StatelessWidget {
  const AESApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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

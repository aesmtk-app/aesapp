import 'dart:io';
import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/helpers/hive.dart';
import 'package:aesapp/helpers/themes.dart';
import 'package:aesapp/ui/TestPage.dart';
import 'package:aesapp/ui/page_selector.dart';
import 'package:aesapp/ui/settings/settings_home.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:logging/logging.dart';
import 'generated/l10n.dart';
import 'package:aesapp/helpers/firebase_options.dart';

final Logger logger = Logger("main");
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
void main() async {
  // use when supported by getx: usePathUrlStrategy();
  // set services
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unnecessary_cast
  Get.put(DarkDashTheme() as AESTheme);
  Get.put(await HiveAPI().init());
  // debugRepaintRainbowEnabled = true;
  Box box = Hive.box(HiveKeys.boxName);
  // Logger
  List<LogRecord> logs = [];
  Get.put<List<LogRecord>>(logs, tag: "logs");
  Get.put<API>(API(dio.Dio(), baseUrl: API.apiEndpoint));
  Get.put<DataProvider>(DataProvider());
  Logger.root.level = Level.FINEST; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode||(box.get(HiveKeys.settings.debugging.enabled)??false)) {
      logs.add(record);
      print(
          '${record.loggerName}: ${record.level.name}: ${record.time}: ${record.message}');
    }
  });

  initFirebase().whenComplete(() => logger.info("fcm initialized"));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
  ));

//Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);

  runApp(AESApp(box: box,));
}

Future<bool> initFirebase({bool force=false})async{
  Box box = Hive.box(HiveKeys.boxName);
  String? token;
  // init firebase
  if(AESAppUtils.supportsFCM()&&((box.get(HiveKeys.settings.notifications.fcmBasedNotificationsEnabled)??false)||force)){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // init FCM
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    logger.info('User granted permission: ${settings.authorizationStatus}');
    logger.info("IsWeb: $kIsWeb");
    // FCM

    token = await messaging.getToken(
      vapidKey: kIsWeb?"BKQDFqLyjkDiJXcilsd2nVjBVSoeRy5ydXzeMyIniZN-5VkJsW5HMLhqm-y8Zbtd7SosUksbJ0yYMJNzPHoSbOs":null,
    );


    logger.info("TOKEN: $token");

    // FCM in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.info('Got a message whilst in the foreground!');
      logger.info('Message data: ${message.data}');
      logger.info(message.data.entries);

      if (message.notification != null) {
        logger.info('Message also contained a notification: ${message.notification}');
        logger.info(message.notification?.title);
        logger.info(message.notification?.body);
      }
    });
    if(token!=null&&box.get(HiveKeys.settings.notifications.fcmToken)!=token){
      logger.info("Updating or creating token on api");
      late dio.Response response;
      if(box.get(HiveKeys.settings.notifications.aesAppId)==null){
        response = await dio.Dio().post(API.apiEndpoint+API.subscribe, queryParameters: {"token":token});
      }
      else{
        response = await dio.Dio().put(API.apiEndpoint+API.subscribe, queryParameters: {"id":box.get(HiveKeys.settings.notifications.aesAppId),"token":token});
      }
      if([200,201].contains(response.statusCode)){
        box.put(HiveKeys.settings.notifications.fcmToken, token);
        box.put(HiveKeys.settings.notifications.aesAppId, response.data["id"]);
      }
      else{
        return false;
      }
    }
    return true;
  }
  else{
    logger.info("FCM not available or disabled");
    return false;
  }
}

class AESApp extends StatelessWidget {
  const AESApp({required this.box, super.key});
  final Box box;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AESMTK-APP',
      theme: AESAppUtils.getDeviceType(context)==DeviceType.watch&&(!kIsWeb&&(Platform.isAndroid||Platform.isIOS))?AESAppUtils.getTheme().copyWith(visualDensity: VisualDensity.compact, useMaterial3: false):AESAppUtils.getTheme(),
      themeMode: ThemeMode.light, // until get v5 released
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      getPages: [
        GetPage(name: "/", page: ()=>const RootPageSelector()),
        GetPage(name: "/test", page: ()=>const TestPage(),),
        ...SettingsCategory.categories.map((e) => GetPage(name: e.routeName, page: ()=>e.page())),
        ...AESPage.defaultPages.values.map((e) => GetPage(name: e.routeName, page: ()=>e.page()))
      ],

      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
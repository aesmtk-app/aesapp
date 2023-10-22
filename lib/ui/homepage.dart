import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;



import '../main.dart';

final logger = Logger("appwrite");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    getWebdata();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getWebdata() async{
    
    var response = await http.get(Uri.parse('https://www.google.com'),headers: {"Access-Control-Allow-Origin": "*","Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",});
    
    //dom.Document html = dom.Document.html(response.body);


    //final titel = html.querySelector('div.items-leading.clearfix > div > h2 > a')?.innerHtml;

    debugPrint('Count: ${response}');

  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: ()async{
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
            print('User granted permission: ${settings.authorizationStatus}');
            print(kIsWeb);
            // FCM

            token = await messaging.getToken(
              vapidKey: kIsWeb?"BKQDFqLyjkDiJXcilsd2nVjBVSoeRy5ydXzeMyIniZN-5VkJsW5HMLhqm-y8Zbtd7SosUksbJ0yYMJNzPHoSbOs":null,
            );
            setState(() {});


            print("TOKEN: $token");

            // FCM in foreground
            FirebaseMessaging.onMessage.listen((RemoteMessage message) {
              print('Got a message whilst in the foreground!');
              print('Message data: ${message.data}');
              print(message.data.entries);

              if (message.notification != null) {
                print('Message also contained a notification: ${message.notification}');
                print(message.notification?.title);
                print(message.notification?.body);
              }
            });

            // FCM subscribe topic
            // subscribe to topic on each app start-up
            if(!kIsWeb){
              await FirebaseMessaging.instance.subscribeToTopic('test');
            }

          },
          child: const Text("setupFCM")
      ),
      ElevatedButton(
        child: const Text("testAppwrite"),
        onPressed: ()async{

        }
      ),
      Text(token?.substring(0,40)??"no token"),
      if(token!=null)QrImageView(data: token!, size: 500,backgroundColor: Colors.white,),
      ElevatedButton(onPressed: ()=>Get.toNamed("/test"), child: Text("test")),

      Card(
        child:Text('DATA')
      )
    ],);
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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


            setState(()async {
              token = await messaging.getToken(
                vapidKey: kIsWeb?"BKQDFqLyjkDiJXcilsd2nVjBVSoeRy5ydXzeMyIniZN-5VkJsW5HMLhqm-y8Zbtd7SosUksbJ0yYMJNzPHoSbOs":null,
              );
            });


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
          child: Text("setupFCM")
      ),
      Text(token?.substring(0,40)??"no token")
    ],);
  }
}

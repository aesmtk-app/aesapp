import 'dart:convert';

import 'package:aesapp/static/app.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';

final logger = Logger("appwrite");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 100,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Filter",
            border: OutlineInputBorder()
          ),
        ),

      ),
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

            // send to endpoint
           await Dio().post(apiEndpoint+vplanSubscribe, queryParameters: {"token": token,"id":md5.convert(utf8.encode(token!)).toString(), "filter":_controller.text, "device":"Web",},);

          },
          child: const Text("setupFCM")
      ),
    ],);
  }
}

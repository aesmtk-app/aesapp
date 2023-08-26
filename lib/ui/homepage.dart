import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

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
          Client client = Client();
          client
              .setEndpoint('http://localhost:8080/v1')
              .setProject('64e77a31d0ecf18d7da0')
              .setSelfSigned(status: true); // For self signed certificates, only use for development
          final account = Account(client);

          final session = await account.createEmailSession(
              email: 'test@example.com',
              password: 'test1234'
          );
          Databases databases = Databases(client);

          Future result = databases.listDocuments(
            databaseId: '64e7906f49a1ed6e24b8',
            collectionId: '64e79079d4796a023166',
          );

          result
              .then((response) {
            print(response);
          }).catchError((error) {
            print(error.response);
          });


          final realtime = Realtime(client);
          final subscription = realtime.subscribe(['databases.64e7906f49a1ed6e24b8.collections.64e79079d4796a023166.documents', 'files']);

          subscription.stream.listen((response) {
            // Callback will be executed on changes for documents A and all files.
            print(response);
          });

          Future res = databases.createDocument(databaseId: "64e7906f49a1ed6e24b8", collectionId: "64e79079d4796a023166", documentId: ID.unique(), data: {
            "id":1234,
            "runs": true,
            "mail": "mail1234@web1234.de"
          });

          res.then((response) {
            print(response);
          }).catchError((error) {
            print(error.response);
          });

        }
      ),
      Text(token?.substring(0,40)??"no token"),
      ElevatedButton(onPressed: ()=>Get.toNamed("/test"), child: Text("test"))
    ],);
  }
}

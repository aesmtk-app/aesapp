import 'package:appwrite/models.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../main.dart';

final logger = Logger("appwrite");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RealtimeSubscription subscription;
  late Realtime realtime;
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
              .setEndpoint('https://appwrite.aws1313.de/v1')
              .setProject('64f20b9232abc5216f68')
              .setSelfSigned(status: true); // For self signed certificates, only use for development
          /*final account = Account(client);

          final session = await account.createEmailSession(
              email: 'test1@example.com',
              password: 'test1234'
          );*/
          Databases databases = Databases(client);

          Future<DocumentList> result = databases.listDocuments(
            databaseId: '64f215b014b23266d752',
            collectionId: '64f215c8191c0f6d23dd',
          );

          result
              .then((response) {
            print(response);
            for (Document d in response.documents){
              print(d.data);
            }

          }).catchError((error) {
            print(error.response);
          });


          realtime = Realtime(client);
          subscription = realtime.subscribe(['databases.64f215b014b23266d752.collections.64f215c8191c0f6d23dd.documents', 'files', "documents"]);

          subscription.stream.listen((response) {
            // Callback will be executed on changes for documents A and all files.
            logger.info(response);
          });

          /*Future res = databases.createDocument(databaseId: "64e7906f49a1ed6e24b8", collectionId: "64e79079d4796a023166", documentId: ID.unique(), data: {
            "id":1234,
            "runs": true,
            "mail": "mail1234@web1234.de"
          });

          res.then((response) {
            print(response);
          }).catchError((error) {
            print(error.response);
          });*/

        }
      ),
      Text(token?.substring(0,40)??"no token"),
      if(token!=null)QrImageView(data: token!, size: 500,backgroundColor: Colors.white,),
      ElevatedButton(onPressed: ()async{
        final channel = WebSocketChannel.connect(
          Uri.parse('wss://appwrite.aws1313.de/v1/realtime?project=64f20b9232abc5216f68&channels%5B%5D=databases.64f215b014b23266d752.collections.64f215c8191c0f6d23dd.documents&channels%5B%5D=files&channels%5B%5D=documents'),
        );
        channel.stream.listen((event) { logger.info(event);});
      }, child: Text("test"))
    ],);
  }
}

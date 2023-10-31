import 'package:aesapp/main.dart';
import 'package:aesapp/static/app.dart';
import 'package:aesapp/static/hive.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fcm;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:aesapp/static/firebase_options.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

Logger logger = Logger("NotificationSettings");
class NotificationSettings extends StatefulWidget {
  const NotificationSettings({ this.calledAsWidget=false, super.key});
  final bool calledAsWidget;
  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  Box box = Hive.box(HiveKeys.boxName);
  late bool fcmEnabled;

  @override
  void initState() {
    fcmEnabled = box.get(HiveKeys.settings.notifications.fcmBasedNotificationsEnabled)??false;
    super.initState();
  }

  Future setFCM(bool enabled)async{
    if (!AESAppUtils.supportsFCM()&&enabled){
      AESAppUtils.showErrorToast("OS not supported");
      logger.warning("FCM not supported");
      return;
    }
    else if(enabled){
      bool success = false;
      BuildContext context = Get.context!;
      ColorScheme scheme = Theme.of(context).colorScheme;
      ProgressDialog pd = ProgressDialog(context: context);
      try{
        pd.show(msg: "Firebase initialisieren", backgroundColor: scheme.surface, msgColor: scheme.onBackground, progressValueColor: scheme.primary,elevation: 0.0, msgMaxLines: 2,hideValue: true);
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        pd.update(msg: "Warte für Benachrichtigungs-Berechtigung");
        fcm.FirebaseMessaging messaging = fcm.FirebaseMessaging.instance;
        fcm.NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        if(!(settings.authorizationStatus==fcm.AuthorizationStatus.authorized)){
          AESAppUtils.showErrorToast("Berechtigung verwehrt");
          return;
        }
        pd.update(msg: "Firebase einrichten");
        await initFirebase(force: true);
        success=true;
      }
      finally{
        if(success){
          pd.update(msg: "Erfolgreich!");
        }
        else{
          pd.update(msg: "Fehlgeschlagen :(");
        }
        pd.close(delay: 2);
      }

    }
    setState(() {
      fcmEnabled = enabled;
    });
    box.put(HiveKeys.settings.notifications.fcmBasedNotificationsEnabled, enabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isPortrait||(!widget.calledAsWidget)?CustomAppBar.get(title: "Benachrichtigungen"):null,
      body: ListView(
        children: [
          ListTile(
            title: const Text("Notifications-Provider"),
            textColor: Theme.of(context).colorScheme.primary,
          ),
          // FMC enabled?
          SwitchListTile(
            title: const Text("Benachrichtungen durch Firebase-Cloud-Messaging (Google)"),
            value: fcmEnabled,
            onChanged: setFCM,
            thumbColor: MaterialStateProperty.resolveWith((states) => AESAppUtils.getSwitchThumbColor(states)),
          ),
        ],
      ),
    );
  }
}

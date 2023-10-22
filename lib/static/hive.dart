import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../objects/theme.dart';
import 'api.dart';

class HiveKeys{
  static String boxName = "aesapp";
  static String apiEndpoint = "api_endpoint";
  static HiveSettingsKeys settings = HiveSettingsKeys();

  static Future setDefaults()async{
    Box box = Hive.box(boxName);
    if(box.get(apiEndpoint)==null) box.put(apiEndpoint, API.defaultApiEndpoint);
    if(box.get(settings.appearance.materialYouColorValue)==null) box.put(settings.appearance.materialYouColorValue, Get.find<AESTheme>().pink.value);
  }

  static Future reset()async{
    Box box = Hive.box(boxName);
    await box.clear().then((value)async => await setDefaults());
  }
}

class HiveSettingsKeys{
  HiveSettingsAppearanceKeys appearance = HiveSettingsAppearanceKeys();
  HiveSettingsNotificationsKeys notifications = HiveSettingsNotificationsKeys();
  HiveSettingsDebuggingKeys debugging = HiveSettingsDebuggingKeys();
}

class HiveSettingsAppearanceKeys{
  String materialYouEnabled = "settings.appearance.materialYouEnabled";
  String materialYouColorValue = "settings.appearance.materialYouColor";
}

class HiveSettingsNotificationsKeys{
  String fcmBasedNotificationsEnabled = "settings.notifications.fcm_based_notifications_enabled";
  String fcmToken = "settings.notifications.fcmToken";
  String aesAppId = "settings.notifications.aesAppId";
}

class HiveSettingsDebuggingKeys{
  String enabled = "settings.debugging.enabled";
}
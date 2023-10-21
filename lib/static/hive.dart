class HiveKeys{
  static String boxName = "aesapp";
  static String apiEndpoint = "api_endpoint";
  static HiveSettingsKeys settings = HiveSettingsKeys();
}

class HiveSettingsKeys{
  HiveSettingsNotificationsKeys notifications = HiveSettingsNotificationsKeys();
  HiveSettingsDebuggingKeys debugging = HiveSettingsDebuggingKeys();
}

class HiveSettingsNotificationsKeys{
  String fcmBasedNotificationsEnabled = "settings.notifications.fcm_based_notifications_enabled";
  String fcmToken = "settings.notifications.fcmToken";
  String aesAppId = "settings.notifications.aesAppId";
}

class HiveSettingsDebuggingKeys{
  String enabled = "settings.debugging.enabled";
}
import 'package:aesapp/static/hive.dart';
import 'package:hive/hive.dart';

class API{
  static String defaultApiEndpoint = "https://api.aesmtk.app";
  static String get apiEndpoint => Hive.box(HiveKeys.boxName).get(HiveKeys.apiEndpoint);
  static String vPlanSubscribe = "/vplan/subscribe";
  static String vPlan = "/vplan";
  static String subscribe = "/subscribe";
  static String mensa = "/mensa";
}
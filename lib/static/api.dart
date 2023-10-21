import 'package:aesapp/static/app.dart';
import 'package:aesapp/static/hive.dart';
import 'package:hive/hive.dart';

class API{
  static String defaultApiEndpoint = "https://api.aesmtk.app";
  static String get apiEndpoint => Hive.box(HiveKeys.boxName).get(HiveKeys.apiEndpoint);
}
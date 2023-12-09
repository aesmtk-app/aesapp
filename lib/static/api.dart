import 'dart:math';

import 'package:aesapp/static/hive.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
Logger logger = Logger("API");
class API{
  static String defaultApiEndpoint = "https://api.aesmtk.app";
  static String get apiEndpoint => Hive.box(HiveKeys.boxName).get(HiveKeys.apiEndpoint);
  static String vPlanSubscribe = "/vplan/subscribe";
  static String vPlan = "/vplan";
  static String subscribe = "/subscribe";
  static String mensa = "/mensa";

  static Future<bool> checkConnection()async{
    try{
      if(await Dio(BaseOptions(connectTimeout: Duration(seconds: 4), receiveTimeout: Duration(seconds: 4))).get("${API.apiEndpoint}/?${Random().nextInt(1000000)}").then((value) => value.statusCode==200)){
        return true;
      }
      logger.warning("Server not available!");
      return false;
    }on DioException catch (_, e){
      logger.warning("Server not available!");
      return false;
    }
  }
}
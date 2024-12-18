import 'dart:math';

import 'package:aesapp/objects/mensa.dart';
import 'package:aesapp/objects/news.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/helpers/hive.dart';
import 'package:dio/dio.dart';
import 'package:hive_ce/hive.dart';
import 'package:logging/logging.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

Logger logger = Logger("API");

@RestApi()
abstract class API{
  factory API(Dio dio, {String baseUrl}) = _API;
  static String defaultApiEndpoint = "https://api.aes.schule";
  static String get apiEndpoint => Hive.box(HiveKeys.boxName).get(HiveKeys.apiEndpoint);
  static String vPlanSubscribe = "/vplan/subscribe";
  static String vPlan = "/vplan";
  static String subscribe = "/subscribe";
  static String mensa = "/mensa";

  @GET("/vplan")
  Future<List<VPlanEntry>> getAllVPlanEntries();

  @GET("/mensa")
  Future<List<Menu>> getAllMenus();

  @GET("/news")
  Future<List<NewsPreview>> getAllArticles(
      @Query("page") String page,
      @Query("count") String count
      );

  @GET("/news/article")
  Future<NewsArticle>getArticle(
      @Query("id") String articleId
      );

  @GET("/vplan/subscribe")
  Future<List<String>> getVPlanFilter(
      @Query("id") String aesappId
      );

  @DELETE("/vplan/subscribe/all")
  Future deleteAllVPlanFilters(
      @Query("id") String aesappId
      );

  @POST("/vplan/subscribe")
  Future addVPlanFilter(
      @Query("id") String aesappId,
      @Query("filter") String filter,
      );

  static Future<bool> checkConnection()async{
    try{
      if(await Dio(BaseOptions(connectTimeout: const Duration(seconds: 4), receiveTimeout: const Duration(seconds: 4))).get("${API.apiEndpoint}/?${Random().nextInt(1000000)}").then((value) => value.statusCode==200)){
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
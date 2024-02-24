import 'package:aesapp/objects/news.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/objects/timetable.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:listenable_stream/listenable_stream.dart';

import 'api.dart';

class DataProvider{
  Future<Box<VPlanEntry>> vPlanFuture = Hive.openBox<VPlanEntry>("vplan");
  Future<Box<Timetable>> timetableFuture = Hive.openBox("timetable");
  Future<Box<TimetableEntry>> timetableEntryFuture = Hive.openBox("timetable_entries");
  Future<Box<NewsPreview>> newsPreviewCache = Hive.openBox("news_preview_cache");
  DataProvider();

  ValueNotifier<bool> vPlanChange = ValueNotifier(false);
  ValueNotifier<bool> timetableChange = ValueNotifier(false);
  ValueNotifier<bool> timetableEntryChange = ValueNotifier(false);
  ValueNotifier<bool> newsChange = ValueNotifier(false);

  Future refreshVPlanEntries()async{
    Box<VPlanEntry> vPlan = await vPlanFuture;
    vPlan.clear();
    vPlan.addAll(await Get.find<API>().getAllVPlanEntries());
    vPlanChange.value=!vPlanChange.value;
  }

  Stream<List<VPlanEntry>> allVPlanEntries() async*{
    Box<VPlanEntry> vPlan = await vPlanFuture;
    if(vPlan.values.isNotEmpty) {
      yield vPlan.values.toList();
    }
    refreshVPlanEntries();
    await for (final v in vPlanChange.toStream()){
      if(vPlan.values.isNotEmpty){
        yield vPlan.values.toList();
      }
    }
  }

  List<NewsPreview> newsPreview = [];

  int pageCount = 1;

  Future getMoreNews({int count = 15})async{
    newsPreview.addAll(await Get.find<API>().getAllArticles(pageCount.toString(), count.toString()));
    print("page: "+pageCount.toString());
    pageCount++;
    newsChange.value=!newsChange.value;
    print(newsPreview.length);
  }

  Stream<List<NewsPreview>> allNews() async*{
    Box<NewsPreview> newsPreviewBox = await newsPreviewCache;
    pageCount=1;
    newsPreview = [];
    if(newsPreviewBox.values.isNotEmpty){
      yield newsPreviewBox.values.toList();
    }

    getMoreNews().then((value){
      newsPreviewBox.clear();
      newsPreviewBox.addAll(newsPreview);
    });

    await for (final n in newsChange.toStream()){
      if(newsPreview.isNotEmpty){
        yield newsPreview;
      }
    }
  }

  Stream<List<TimetableEntry>> timetableEntriesByTimetableId(int id) async*{
    yield [

    ] ;
  }


}
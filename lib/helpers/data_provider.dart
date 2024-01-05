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
  DataProvider();

  ValueNotifier<bool> vPlanChange = ValueNotifier(false);
  ValueNotifier<bool> timetableChange = ValueNotifier(false);
  ValueNotifier<bool> timetableEntryChange = ValueNotifier(false);

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

  Stream<List<TimetableEntry>> timetableEntriesByTimetableId(int id) async*{
    yield [TimetableEntry(id: 1, timetableId: 1, weekday: 1, lesson: 1, subject: "hi", teacher: "le", room: "mzr")];
  }


}
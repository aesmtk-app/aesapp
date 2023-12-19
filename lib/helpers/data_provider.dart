import 'dart:math';

import 'package:aesapp/objects/vplan.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:listenable_stream/listenable_stream.dart';

import 'api.dart';

class DataProvider{
  Future<Box<VPlanEntry>> vPlanFuture = Hive.openBox<VPlanEntry>("vplan6");
  DataProvider(){}

  ValueNotifier<String> tasksNotifier = ValueNotifier("");

  Future refreshVPlanEntries()async{
    Box<VPlanEntry> vPlan = await vPlanFuture;
    await Future.delayed(Duration(seconds: 0)).then((value) async{
      print("run");
      vPlan.clear();
      vPlan.addAll(await Get.find<API>().getAllVPlanEntries());
      tasksNotifier.value=Random().nextInt(10000000).toString();
    });
  }

  Stream<List<VPlanEntry>> allVPlanEntries() async*{
    print("call");
    Box<VPlanEntry> vPlan = await vPlanFuture;
    if(vPlan.values.isNotEmpty) {
      yield vPlan.values.toList();
    }
    refreshVPlanEntries();
    await for (final v in tasksNotifier.toStream()){
      if(vPlan.values.isNotEmpty){
        print("hi");
        yield vPlan.values.toList();
      }
    }
  }
}
import 'package:aesapp/objects/vplan.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'api.dart';

class DataProvider{
  Future<Box<VPlanEntry>> vPlanFuture = Hive.openBox("vplan");
  DataProvider(){}

  Future refreshVPlanEntries()async{
    Box<VPlanEntry> vPlan = await vPlanFuture;
    vPlan.flush();
    vPlan.addAll(await Get.find<API>().getAllVPlanEntries());
  }

  Future<ValueListenable<Box<VPlanEntry>>> allVPlanEntries() async{
    Box<VPlanEntry> vPlan = await vPlanFuture;
    refreshVPlanEntries();
    return vPlan.listenable();
  }
}
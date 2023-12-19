import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/vplan/vplan_card.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../helpers/hive.dart';
class VPlanPage extends StatefulWidget {
  const VPlanPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<VPlanPage> createState() => _VPlanPageState();
}

class _VPlanPageState extends State<VPlanPage> {
  Box box = Hive.box(HiveKeys.boxName);

  @override
  Widget build(BuildContext context) {
    Future<ValueListenable<Box<VPlanEntry>>> vPlanBox = Get.find<DataProvider>().allVPlanEntries();
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Vertretung"):null,
      body: RefreshIndicator(
        onRefresh: ()=>Future(() => null),
        child: FutureBuilder(
          future: vPlanBox,
          builder: (BuildContext context, AsyncSnapshot<ValueListenable<Box<VPlanEntry>>> mbox){
            print("recv future");
            if (mbox.hasData){
              return ValueListenableBuilder(
                  valueListenable: mbox.data!,
                  builder: (BuildContext context, Box<VPlanEntry> box, widget){
                    print("val cahnged");
                    List<VPlanEntry> entries = box.values.toList();
                    Map<DateTime, List<VPlanEntry>> entriesByDate = groupBy(entries, (p0) => p0.date);
                    entriesByDate = Map.fromEntries(entriesByDate.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
                    if(entriesByDate.keys.length>2) entriesByDate.removeWhere((key, value) => ![entriesByDate.keys.elementAt(entriesByDate.keys.length-2),entriesByDate.keys.elementAt(entriesByDate.keys.length-1)].contains(key));
                    for (var element in entriesByDate.values) {element.sort((a,b){
                      int aLS = a.lessonStart ?? 0;
                      int bLS = b.lessonStart ?? 0;
                      int aLE = a.lessonEnd ?? aLS;
                      int bLE = b.lessonEnd ?? bLS;
                      int lSc = aLS.compareTo(bLS);
                      if (lSc!=0) return lSc;
                      return aLE.compareTo(bLE);
                    });}
                    if(context.isPortrait){
                      List<Widget> w = [];
                      for (List<Widget> wl in entriesByDate.values.map((e) => [Text(AESAppUtils.dateFormat.format(e.first.date)),...e.map((f) => VPlanCard(v: f))])) {
                        w.addAll(wl);
                      }
                      return ListView(
                        children: w,
                      );
                    }
                    else{
                      return Row(
                        children: entriesByDate.values.map((e) => Expanded(child: ListView(children: [Text(AESAppUtils.dateFormat.format(e.first.date)), ...e.map((f) => VPlanCard(v: f))],))).toList(),
                      );
                    }
                  }
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      )
      );
  }
}

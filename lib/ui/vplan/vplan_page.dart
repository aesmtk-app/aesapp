import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/static/api.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/vplan/vplan_card.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../static/hive.dart';
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
    Future<dio.Response<List>> vPlanData = dio.Dio().get(API.apiEndpoint+API.vPlan);
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Vertretung"):null,
      body: FutureBuilder(
        future: vPlanData,
        builder: (BuildContext context, AsyncSnapshot<dio.Response<List>> snapshot){
          if (snapshot.hasData){
            List<VPlanEntry> entries = snapshot.data!.data!.map((e) => VPlanEntry.fromJSON(e)).toList();
            Map<DateTime, List<VPlanEntry>> entriesByDate = groupBy(entries, (p0) => p0.date);
            entriesByDate = Map.fromEntries(entriesByDate.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
            if(context.isPortrait){
              List<Widget> w = [];
              for (List<Widget> wl in entriesByDate.values.map((e) => [Text(e.first.date.toIso8601String()),...e.map((f) => VPlanCard(v: f))])) {
                w.addAll(wl);
              }
              return ListView(
                children: w,
              );
            }
            else{
              return Row(
                children: entriesByDate.values.map((e) => Expanded(child: ListView(children: [Text(e.first.date.toIso8601String()), ...e.map((f) => VPlanCard(v: f))],))).toList(),
              );
            }
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
      );
  }
}
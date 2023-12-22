import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/timetable.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/timetable/timetable_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
class TimetablePage extends StatefulWidget {
  const TimetablePage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  Stream<List<TimetableEntry>> entriesStream = Get.find<DataProvider>().timetableEntriesByTimetableId(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Stundenplan"):null,
      body: StreamBuilder(
        stream: entriesStream,
        builder: (BuildContext context, AsyncSnapshot<List<TimetableEntry>> snap){
          if(snap.hasData){
            return ResponsiveGridList(
              horizontalGridSpacing: 2,
              verticalGridSpacing: 2,
              horizontalGridMargin: 0,
              verticalGridMargin: 0,
              minItemWidth: 100,
              minItemsPerRow: 1,
              maxItemsPerRow: 1,
              listViewBuilderOptions: ListViewBuilderOptions(),
              children: snap.data!.map((e) => TimetableCellCard(e)).toList(),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}

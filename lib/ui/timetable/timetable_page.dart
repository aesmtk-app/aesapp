import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/timetable.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/timetable/timetable_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimetableDimensions{
  TimetableDimensions(this.x, this.y);
  int x;
  int y;
}

class TimetablePage extends StatefulWidget {
  const TimetablePage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  Stream<List<TimetableEntry>> entriesStream = Get.find<DataProvider>().timetableEntriesByTimetableId(1);

  TimetableDimensions _getTableDimensions(List<TimetableEntry> entries){
    List<int> days = entries.map((e) => e.weekday).toList();
    days.sort();
    List<int> lessons = entries.map((e) => e.lesson).toList();
    lessons.sort();
    return TimetableDimensions(days.last+1, lessons.last+1);
  }

  Widget _getWeekDayCell(int weekday){
    return TableCell(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(border: Border(left: BorderSide(color: Colors.white))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(weekday.toString())
        ],
      ),
    ));
  }

  Widget _getLessonCell(int lesson){
    return TableCell(
        child: Container(
          decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white))),
          child: Column(
            children: [
              const SizedBox(height: 2, width: 10,),
              Text(lesson.toString()),
              Text(lesson.toString()),
              Text(lesson.toString()),
              const SizedBox(height: 2, width: 10,),
            ],

          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Stundenplan"):null,
      body: StreamBuilder(
        stream: entriesStream,
        builder: (BuildContext context, AsyncSnapshot<List<TimetableEntry>> snap){
          if(snap.hasData){
            List<TimetableEntry> entries = [
              TimetableEntry(id: 1, timetableId: 1, weekday: 0, lesson: 0, subject: "hi", teacher: "wo", room: "ja"),
              TimetableEntry(id: 2, timetableId: 1, weekday: 1, lesson: 2, subject: "hi", teacher: "wo", room: "ja"),
              TimetableEntry(id: 3, timetableId: 1, weekday: 1, lesson: 1, subject: "hi", teacher: "wo", room: "ja"),
              TimetableEntry(id: 4, timetableId: 1, weekday: 4, lesson: 5, subject: "hi", teacher: "wo", room: "ja"),
            ];
            TimetableDimensions dimensions = _getTableDimensions(entries);

            List<List<Widget>> widgetMatrix = List.generate(dimensions.y, (index) =>
                List.generate(dimensions.x+1, (i)=>Text(i.toString())));

            for (TimetableEntry element in entries) {
              widgetMatrix[element.lesson][element.weekday+1] = TableCell(child: TimetableCellCard(element));
            }
            for (final (i, w) in widgetMatrix.indexed){
              w[0] = _getLessonCell(i);
            }

            TableRow weekdayRow = TableRow(
              children: [TableCell(child: Container()), ...List.generate(dimensions.x, (index) => _getWeekDayCell(index))]
            );


            return Table(
              children: [weekdayRow, ...widgetMatrix.map((e) => TableRow(children: e))],
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}

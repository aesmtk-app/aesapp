import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/timetable.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/timetable/timetable_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart' as io;

class TimetableDimensions{
  TimetableDimensions(this.x, this.y);
  int x;
  int y;
}

class LessonTime{
  LessonTime(this.lesson, this.start, this.end);
  int lesson;
  DateTime start;
  DateTime end;
}

class TimetablePage extends StatefulWidget {
  const TimetablePage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  Stream<List<TimetableEntry>> entriesStream = Get.find<DataProvider>().timetableEntriesByTimetableId(1);
  var days = DateFormat.EEEE(io.Platform.localeName).dateSymbols.STANDALONESHORTWEEKDAYS;

  bool dragging = false;

  List<LessonTime> lessonTime = [
    LessonTime(1, DateTime(0,0,0,7,55), DateTime(0,0,0,8,45)),
    LessonTime(2, DateTime(0,0,0,8,50), DateTime(0,0,0,9,30)),
    LessonTime(3, DateTime(0,0,0,9,45), DateTime(0,0,0,10,30)),
    LessonTime(4, DateTime(0,0,0,10,35), DateTime(0,0,0,11,20)),
    LessonTime(5, DateTime(0,0,0,11,35), DateTime(0,0,0,12,20)),
    LessonTime(6, DateTime(0,0,0,12,25), DateTime(0,0,0,13,10)),
    LessonTime(7, DateTime(0,0,0,13,15), DateTime(0,0,0,14,00)),
    LessonTime(8, DateTime(0,0,0,14,5), DateTime(0,0,0,14,50)),
    LessonTime(9, DateTime(0,0,0,14,55), DateTime(0,0,0,15,40)),
    LessonTime(10, DateTime(0,0,0,15,45), DateTime(0,0,0,16,30)),
    LessonTime(11, DateTime(0,0,0,16,35), DateTime(0,0,0,17,10)),
    LessonTime(12, DateTime(0,0,0,17,15), DateTime(0,0,0,18,00)),
    LessonTime(13, DateTime(0,0,0,18,5), DateTime(0,0,0,18,50)),
    LessonTime(14, DateTime(0,0,0,18,55), DateTime(0,0,0,19,40)),
    LessonTime(15, DateTime(0,0,0,19,45), DateTime(0,0,0,20,30)),
  ];

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
          Text(days[weekday+1], style: const TextStyle(fontWeight: FontWeight.bold),)
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
              Text(AESAppUtils.hourMinuteFormat.format(lessonTime[lesson].start)),
              Text(lessonTime[lesson].lesson.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
              Text(AESAppUtils.hourMinuteFormat.format(lessonTime[lesson].end)),
              const SizedBox(height: 2, width: 10,),
            ],

          ),
        )
    );
  }

  bool editorMode = false;
  final GlobalKey _draggableKey = GlobalKey();
  List<TimetableEntry> entries = [
    TimetableEntry(id: 1, timetableId: 1, weekday: 0, lesson: 0, subject: "hi", teacher: "wo", room: "ja", color: Colors.amber.value),
    TimetableEntry(id: 2, timetableId: 1, weekday: 1, lesson: 2, subject: "hi", teacher: "wo", room: "ja", color: Colors.red.value),
    TimetableEntry(id: 3, timetableId: 1, weekday: 1, lesson: 1, subject: "hi", teacher: "wo", room: "ja", color: Colors.amber.value),
    TimetableEntry(id: 4, timetableId: 1, weekday: 4, lesson: 5, subject: "hi", teacher: "wo", room: "ja", color: Colors.greenAccent.value),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Stundenplan"):null,
      body: StreamBuilder(
        stream: entriesStream,
        builder: (BuildContext context, AsyncSnapshot<List<TimetableEntry>> snap){

          if(snap.hasData){
            
            TimetableDimensions dimensions = _getTableDimensions(entries);

            late List<List<Widget>> widgetMatrix;
            widgetMatrix = List.generate(dimensions.y, (index) =>
                List.generate(dimensions.x+1, (i)=>TableCell(child: DragTarget<TimetableEntry>(builder: (context, candidateItems, rejectedItems){
                  return (!dragging)?Container():TimetableCellCard(TimetableEntry.empty(), dragField: true, candidate: candidateItems.isNotEmpty,);
                }, onAcceptWithDetails: (details)=>setState(() {
                    entries.add(details.data.copyWith(lesson: index, weekday: i-1));
                  print("acc");
                }),))));

            for (TimetableEntry element in entries) {
              Widget w = LongPressDraggable<TimetableEntry>(
                data: element,
                onDragStarted: ()=>setState(() {
                  dragging=true;
                }),
                onDragEnd: (f)=>setState(() {
                  dragging=false;
                }),
                dragAnchorStrategy: pointerDragAnchorStrategy,
                  child: TimetableCellCard(element), feedback: SizedBox(height: 50, width: 50, key: _draggableKey, child: Container(color: Colors.red,),)
              );
              widgetMatrix[element.lesson][element.weekday+1] = TableCell(child: w);
            }
            for (final (i, w) in widgetMatrix.indexed){
              w[0] = _getLessonCell(i);
            }

            TableRow weekdayRow = TableRow(
              children: [TableCell(child: Container()), ...List.generate(dimensions.x, (index) => _getWeekDayCell(index))]
            );


            return ListView(
              children: [
                Table(
                children: [weekdayRow, ...widgetMatrix.map((e) => TableRow(children: e))],
                ),
                Switch(value: editorMode, onChanged: (val){setState(() {
                  editorMode=val;
                });})
              ],
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}

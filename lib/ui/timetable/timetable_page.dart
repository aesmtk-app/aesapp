import 'dart:math';

import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/helpers/data_provider.dart';
import 'package:aesapp/objects/timetable.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/timetable/timetable_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart' as io;
import 'package:faabul_color_picker/faabul_color_picker.dart';

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
  Stream<List<TimetableEntry>> entriesStream = Get.find<DataProvider>().timetableEntries();
  var days = DateFormat.EEEE(io.Platform.localeName).dateSymbols.STANDALONESHORTWEEKDAYS;

  bool dragging = false;
  bool editing = false;

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
    late int x;
    late int y;
    if (days.isNotEmpty) {
      x = days.last+1;
      x = 5; // temporary
    } else {
      x = 5;
    }
    if (lessons.isNotEmpty){
      y = lessons.last+1;
    } else {
      y = 1;
    }

    return TimetableDimensions(x, y);
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

  Widget _addHint(int x, int y){
    return Center(child: IconButton(
      icon: const Icon(Icons.add_circle_outline_rounded),
      onPressed: ()async{
        TimetableEntry? e = await showDialog(context: context, builder: (builder)=>_addDialog());
        if (e!=null){
          await Get.find<DataProvider>().addTimetableEntry(e.copyWith(weekday: x-1, lesson: y));
        }
      },
    ),);
  }

  Widget _addDialog(){
    final formKey = GlobalKey<FormState>();
    Color? selectedColor;
    TextEditingController subject = TextEditingController();
    TextEditingController room = TextEditingController();
    TextEditingController teacher = TextEditingController();
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,
                  child:TextFormField(
                    controller: subject,
                    decoration: InputDecoration(
                      hintText: "Fach",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: room,
                    decoration: InputDecoration(
                      hintText: "Raum",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: teacher,
                    decoration: InputDecoration(
                      hintText: "Lehrer",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                SizedBox(
                  width: 300,
                  child: FaabulColorPicker(colors: FaabulColorShades.materialColors(), selected: selectedColor, onSelected: (c){selectedColor=c;}),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(onPressed: ()=>Get.back(), child: Text("Abbrechen")),
                    TextButton(onPressed: (){
                      Get.back(result: TimetableEntry(id: 0, timetableId: 1, weekday: 0, lesson: 0, subject: subject.text, teacher: teacher.text, room: room.text, color: (selectedColor??Colors.pink).value));
                    }, child: Text("Speichern"))
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _trashTarget(){
    return DragTarget<TimetableEntry>(builder: (context, candidateItems, rejectedItems){
      return Container(child: Icon(Icons.delete_forever, color: candidateItems.isEmpty?null:Colors.pink,),);
    }, onAcceptWithDetails: (details)async=>details.data.delete());
  }

  bool editorMode = false;
  final GlobalKey _draggableKey = GlobalKey();
  List<TimetableEntry> entries = [
    TimetableEntry(id: 1, timetableId: 1, weekday: 0, lesson: 0, subject: "hi", teacher: "wo", room: "ja", color: Colors.amber.value),
    TimetableEntry(id: 2, timetableId: 1, weekday: 1, lesson: 2, subject: "hi", teacher: "wo", room: "ja", color: Colors.red.value),
    TimetableEntry(id: 3, timetableId: 1, weekday: 1, lesson: 1, subject: "hi", teacher: "wo", room: "ja", color: Colors.orange.value),
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
            entries=snap.data!;
            late TimetableDimensions dimensions;
            late List<List<Widget>> widgetMatrix;
            if(!editorMode){
              dimensions = _getTableDimensions(entries);
              widgetMatrix = List.generate(dimensions.y, (index) => List.generate(dimensions.x+1, (_)=>Container()));
            } else{
              dimensions = TimetableDimensions(5, 12);
              widgetMatrix = List.generate(dimensions.y, (index) =>
                  List.generate(dimensions.x+1, (i)=>TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: DragTarget<TimetableEntry>(builder: (context, candidateItems, rejectedItems){
                    return (!dragging)?_addHint(i, index):TimetableCellCard(TimetableEntry.empty(), dragField: true, candidate: candidateItems.isNotEmpty,);
                  }, onAcceptWithDetails: (details)async=>Get.find<DataProvider>().addTimetableEntry(details.data.copyWith(lesson: index, weekday: i-1)),))));
            }

            for (TimetableEntry element in entries) {
              if (editorMode) {
                Widget w = LongPressDraggable<TimetableEntry>(
                    data: element,
                    onDragStarted: () =>
                        setState(() {
                          dragging = true;
                        }),
                    onDragEnd: (f) =>
                        setState(() {
                          dragging = false;
                        }),
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    feedback: TimetableCellCard(element),
                    child: TimetableCellCard(element)
                );
                widgetMatrix[element.lesson][element.weekday + 1] =
                    TableCell(child: w);
              } else {
                widgetMatrix[element.lesson][element.weekday + 1] =
                    TableCell(child: TimetableCellCard(element));
              }
            }

            for (final (i, w) in widgetMatrix.indexed){
              w[0] = _getLessonCell(i);
            }



            TableRow weekdayRow = TableRow(
              children: [
                TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: dragging?_trashTarget():Container()),
                ...List.generate(dimensions.x, (index) => _getWeekDayCell(index))
              ]
            );


            return ListView(
              children: [
                Table(
                children: [weekdayRow, ...widgetMatrix.map((e) => TableRow(children: e))],
                ),
                Switch(value: editorMode, thumbColor: WidgetStateProperty.resolveWith((states) => AESAppUtils.getSwitchThumbColor(states)), onChanged: (val){setState(() {
                  dragging=false;
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

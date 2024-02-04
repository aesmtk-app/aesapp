import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

class TimeSchool extends StatefulWidget {
  const TimeSchool({super.key});

  @override
  State<TimeSchool> createState() => _TimeSchoolState();
}

class _TimeSchoolState extends State<TimeSchool> {
  DateTime now =  DateTime.now();
  String period = '';

  List<Map> SchoolTime = [
    {'Period': '1', 'begin':DateTime(0,0,0,7,55), 'end': DateTime(0,0,0,8,45),},
    {'Period': 'PAUSE', 'begin':DateTime(0,0,0,8,45), 'end': DateTime(0,0,0,8,50),},
    {'Period': '2', 'begin':DateTime(0,0,0,8,50), 'end': DateTime(0,0,0,9,30),},
    {'Period': 'PAUSE', 'begin':DateTime(0,0,0,9,30), 'end': DateTime(0,0,0,9,45),},
    {'Period': '3', 'begin':DateTime(0,0,0,9,45), 'end': DateTime(0,0,0,10,30),},
    {'Period': 'PAUSE', 'begin':DateTime(0,0,0,10,30), 'end': DateTime(0,0,0,10,35),},
    {'Period': '4', 'begin':DateTime(0,0,0,10,35), 'end': DateTime(0,0,0,11,20),},
    {'Period': 'PAUSE', 'begin':DateTime(0,0,0,11,20), 'end': DateTime(0,0,0,11,35),},
    {'Period': '4', 'begin':DateTime(0,0,0,11,35), 'end': DateTime(0,0,0,12,20),},
    {'Period': 'PAUSE', 'begin':DateTime(0,0,0,12,20), 'end': DateTime(0,0,0,12,25),},
    {'Period': '6', 'begin':DateTime(0,0,0,12,25), 'end': DateTime(0,0,0,13,10),},
    {'Period': 'Schuleaus', 'begin':DateTime(0,0,0,13,10), 'end': DateTime(0,0,0,23,59),},
    {'Period': 'Schuleaus', 'begin':DateTime(0,0,0,0,0), 'end': DateTime(0,0,0,7,55),},
  ];

  void currentPeriod(n) {

    if(now.isAfter(SchoolTime[n]['begin']) && now.isBefore(SchoolTime[n]['end'])){
      setState(() {
        period = SchoolTime[n]['Period'];
      });
     
    }else{
      n++;
      currentPeriod(n);
      print(now);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    for (var i = 0; i < SchoolTime.length; i++) {
      DateTime saver = SchoolTime[i]['begin'];
      SchoolTime[i]['begin'] =  DateTime(now.year,now.month,now.day,saver.hour,saver.minute);
    }

    for (var i = 0; i < SchoolTime.length; i++) {
      DateTime savertwo = SchoolTime[i]['end'];
      SchoolTime[i]['end'] =  DateTime(now.year,now.month,now.day,savertwo.hour,savertwo.minute);
    }

     int n = 0;
    currentPeriod(n);
  }


  @override
  Widget build(BuildContext context) {
    return  Card(
      // ignore: prefer_interpolation_to_compose_strings
      child: Text('Wir haben die '+ period +' Stunde'),
    );
  }
}
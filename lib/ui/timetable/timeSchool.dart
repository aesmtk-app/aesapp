import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

class TimeSchool extends StatefulWidget {
  const TimeSchool({super.key});

  @override
  State<TimeSchool> createState() => _TimeSchoolState();
}

class _TimeSchoolState extends State<TimeSchool> {
  DateTime now =  DateTime.now();
  int period = 0;

  List<Map> SchoolTime = [
    {'Period': 1, 'begin':DateTime(0,0,0,7,55), 'end': DateTime(0,0,0,8,45),},
    {'Period': 2, 'begin':DateTime(0,0,0,8,50), 'end': DateTime(0,0,0,9,30),},
    {'Period': 3, 'begin':DateTime(0,0,0,9,45), 'end': DateTime(0,0,0,10,30),},
    {'Period': 4, 'begin':DateTime(0,0,0,10,35), 'end': DateTime(0,0,0,11,20),},
    {'Period': 5, 'begin':DateTime(0,0,0,11,35), 'end': DateTime(0,0,0,12,20),},
    {'Period': 6, 'begin':DateTime(0,0,0,12,25), 'end': DateTime(0,0,0,13,10),},
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
      child: Text('Wir haben die '+ period.toString()+ ' Stunde'),
    );
  }
}
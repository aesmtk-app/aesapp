import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VPlanCard extends StatelessWidget {
  const VPlanCard({required this.v, super.key});
  final VPlanEntry v;
  Color _getColor(){
    AESTheme aesTheme = Get.find<AESTheme>();
    if (v.isInfo) return aesTheme.cyan;
    if (v.isCancelled??false) return aesTheme.red;
    if(v.isSelfWork()) return aesTheme.yellow;
    return aesTheme.green;
  }

  Widget _lessonNumber(BuildContext context){
    double? leftFontSize = Theme.of(context).textTheme.titleLarge?.fontSize;

    return Text(
        (v.lessonStart==v.lessonEnd)?v.lessonStart.toString():"${v.lessonStart} - ${v.lessonEnd}",
        style: TextStyle(color: Colors.black,fontSize: leftFontSize));
  }

  Text _styledText(String text){
    return Text(text, style: TextStyle(color: Colors.black),
      textAlign: TextAlign.end,
      softWrap: true,
      maxLines: 7,);
  }

  String _courseName(bool isHS){
    if(isHS) return "${v.course}\n\r${v.subjectOld} (${v.roomOld})";
    return "${v.course??"NaN"}\n\r";
  }


  List<Widget> _content(BuildContext context){

    bool isHighSchool = v.course?.substring(0,1).isAlphabetOnly??false;

    if(v.isInfo) {
      return [
      Expanded(child: Text(
        v.comment??"",
        style: const TextStyle(color: Colors.black, ),
        textAlign: TextAlign.center,
      ))
    ];
    }


    else if(v.isCancelled??false){
      return [
        _lessonNumber(context),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _styledText("Entfall von ${v.subjectOld}\r\nfür ${v.course}"),
          ],
        ))
      ];
    }
    else if(v.isSelfWork()){
      return [
        _lessonNumber(context),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _styledText("Selbstständiges Arbeiten\r\nvon ${v.course} in ${v.subject} (${v.room})"),
          ],
        ))
      ];
    }
    return [
      _lessonNumber(context),

      Expanded(child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if(v.replacement!=null) _styledText("Vertretung von ${v.replacement} für ${_courseName(isHighSchool)}${(v.room!=null||((v.subjectOld?.trim()!=v.subject?.trim())&&v.subject!=null))
          ?"${(v.room!=null&&v.roomOld!=v.room)?" in ${v.room}":""}${((v.subjectOld?.trim()!=v.subject?.trim())&&v.subject!=null)?"${(v.room!=null)?" – ":""}${v.subject}${v.subjectOld!=null?" statt ${v.subjectOld}":""}":""}":""}")

        ],
      ))
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      color: _getColor(),
      child: Container(
        padding: const EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _content(context),
        ),
      ));
  }
}

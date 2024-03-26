import 'package:aesapp/objects/timetable.dart';
import 'package:flutter/material.dart';
class TimetableCellCard extends StatelessWidget {
  const TimetableCellCard(this.entry, {super.key, this.dragField=false, this.dragColor=Colors.black, this.candidateColor=Colors.pink, this.candidate=false});
  final TimetableEntry entry;
  final bool dragField;
  final bool candidate;
  final Color candidateColor;
  final Color dragColor;

  Color? _getColor(bool bg){
    if(!dragField){
      if(bg){
        return null;
      }
      else{
        return Color(entry.color);
      }
    }
    else {
      if (candidate){
        return candidateColor;
      }
      else{
        return dragColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      margin: EdgeInsets.all(2),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: _getColor(false)!, width: 5)
            ),
            color: _getColor(true),
          ),
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: (!dragField)?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.subject),
              Text(entry.teacher),
              Text(entry.room)
            ],
          ):const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(" "), Text(" "), Text(" ")]),
        ),
      ),
    );
  }
}

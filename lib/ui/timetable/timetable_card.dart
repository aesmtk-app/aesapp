import 'package:aesapp/objects/timetable.dart';
import 'package:flutter/material.dart';
class TimetableCellCard extends StatelessWidget {
  const TimetableCellCard(this.entry, {super.key});
  final TimetableEntry entry;
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
              left: BorderSide(color: Color(entry.color), width: 5)
            )
          ),
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.subject),
              Text(entry.teacher),
              Text(entry.room)
            ],
          ),
        ),
      ),
    );
  }
}

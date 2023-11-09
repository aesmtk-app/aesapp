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
    return aesTheme.green;
  }
  @override
  Widget build(BuildContext context) {
    double? leftFontSize = Theme.of(context).textTheme.titleLarge?.fontSize;

    return Card(
      color: _getColor(),
      child: Container(
        padding: const EdgeInsets.all(7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: v.isInfo?[
            Expanded(child: Text(
              v.comment??"",
              style: const TextStyle(color: Colors.black, ),
              textAlign: TextAlign.center,
            ))
          ]:[
            Text(
              (v.lessonStart==v.lessonEnd)?v.lessonStart.toString():"${v.lessonStart} - ${v.lessonEnd}",
              style: TextStyle(color: Colors.black,fontSize: leftFontSize)),
            Column(
              children: [
                Text(v.course??v.subjectOld??"")
              ],
            )
          ],
        ),
      ));
  }
}

import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/objects/vplan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VPlanCard extends StatelessWidget {
  const VPlanCard({required this.v, super.key});
  final VPlanEntry v;

  @override
  Widget build(BuildContext context) {
    AESTheme aesTheme = Get.find<AESTheme>();
    Color getColor(){
      if (v.isInfo) return aesTheme.cyan;
      if (v.isCancelled??false) return aesTheme.red;
      return aesTheme.green;
    }
    return Card(
      color: getColor(),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: v.isInfo?[
            Expanded(child: Text(
              v.comment??"",
              style: TextStyle(color: Colors.black, ),
              textAlign: TextAlign.center,
            ))
          ]:[
            Text(
              (v.lessonStart==v.lessonEnd)?v.lessonStart.toString():"${v.lessonStart} - ${v.lessonEnd}",
              style: TextStyle(color: Colors.black),)
          ],
        ),
      ));
  }
}

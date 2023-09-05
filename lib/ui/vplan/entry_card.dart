import 'package:aesapp/database/database.dart';
import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/static/themes.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EntryCard extends StatelessWidget {
  const EntryCard(this.vPlanEntry, {super.key});
  final VPlanEntry vPlanEntry;

  Color get cardColor{
    AESTheme theme = Get.find<AESTheme>();
    if(vPlanEntry.isInfo) {
      return theme.cyan;
    } else if(vPlanEntry.isSelfWork){
      return theme.yellow;
    }else if (vPlanEntry.isDropped){
      return theme.red;
    }
    return theme.green;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: ColorUtils.isDark("#${cardColor.value.toRadixString(16).substring(2)}")?Colors.white:Colors.black);
    return Card(
      surfaceTintColor: cardColor,
      color: cardColor,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Text(vPlanEntry.subjectNew, style: style,),
      ),
    );
  }
}

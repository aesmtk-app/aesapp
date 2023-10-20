import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar{
  static Widget get menuButton => Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,

      );
    },
  );

  static AppBar get({String title="AESMTK-APP", bool isRailForwarded=true}){
    BuildContext context = Get.context!;
    return AppBar(
      title: Text(title),
      leading: Navigator.canPop(context)?null:(context.isPortrait?menuButton:Container()),
    //leading: IconButton(onPressed: () { Get.offAllNamed("/"); }, icon: Navigator.canPop(context)?Icon(Icons.arrow_back):Icon(Icons.home),

    );
  }
  }
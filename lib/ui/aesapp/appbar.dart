import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar{
  static Widget menuButton() {
    return Builder(builder: (BuildContext context){
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    });
  }

  static Widget homeButton() {
    return IconButton(
      icon: const Icon(Icons.home),
      onPressed: () {
        Get.offAllNamed("/");
        },
    );
  }

  static AppBar get({String title="AESMTK-APP", bool isRailForwarded=true}){
    BuildContext context = Get.context!;
    return AppBar(
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      title: Text(title),
      leading: Navigator.canPop(context)?null:((Get.currentRoute!="/")?homeButton():menuButton()),
    );
  }
  }
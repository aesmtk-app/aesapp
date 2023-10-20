import 'dart:io';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const apiEndpoint = "https://api.aesmtk.app";
const vplanSubscribe = "/vplan/subscribe";
const subscribe = "/subscribe";

class AESAppUtils{
  static int getLandscapeSecondFlexFactor(BuildContext context){
    double flexFactor = 1000;
    final double width = MediaQuery.of(context).size.width;
    if (width >= 800 && width < 1200) {
      flexFactor = lerpDouble(1000, 2000, (width - 800) / 400)!;
    } else if (width >= 1200 && width < 1600) {
      flexFactor = lerpDouble(2000, 3000, (width - 1200) / 400)!;
    } else if (width > 1600) {
      flexFactor = 3000;
    }
    return flexFactor.toInt();
  }
  static bool isPortrait(BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
  static bool supportsFCM(){
    return kIsWeb||Platform.isIOS||Platform.isAndroid||Platform.isMacOS;
  }
  static Color? getSwitchThumbColor(Set<MaterialState> states){
    BuildContext context = Get.context!;
    if (states.contains(MaterialState.hovered)&&states.contains(MaterialState.selected)){
      return Theme.of(context).colorScheme.surface;
    }
    return null;
  }
  static void showErrorToast(String msg){
    BuildContext context = Get.context!;
    BotToast.showText(duration: const Duration(seconds: 4),text: "FEHLER: $msg", borderRadius: BorderRadius.circular(20.0), contentColor: Theme.of(context).colorScheme.surface, textStyle: TextStyle(color: Theme.of(context).colorScheme.primary));
  }
}
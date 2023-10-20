import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const apiEndpoint = "https:://api.aesmtk.app";
const vplanSubscribe = "/vplan/subscribe";

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
}
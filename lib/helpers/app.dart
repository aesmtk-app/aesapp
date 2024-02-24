import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/helpers/themes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

import '../objects/theme.dart';
import 'hive.dart';

Logger logger = Logger("AESAPP-Utils");

const apiEndpoint = "https://api.aesmtk.app";

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
  static ThemeData getTheme(){
    Box box = Hive.box(HiveKeys.boxName);
    return ThemeData(
      colorScheme: (box.get(HiveKeys.settings.appearance.materialYouEnabled)??false)?ColorScheme.fromSeed(seedColor: Color(box.get(HiveKeys.settings.appearance.materialYouColorValue)),brightness: WidgetsBinding.instance.platformDispatcher.platformBrightness):DarkDashTheme().toSwatchScheme(),
      useMaterial3: true,
    );
  }

  static final DateFormat dateFormat = DateFormat("EEEE, 'den' dd.MM.",);

  static final DateFormat monthDayYearFormat = DateFormat("d.M.yy");

  static final DateFormat hourMinuteFormat = DateFormat("HH:mm");

  static void showMissingConnectionBanner(BuildContext context){
    missingConnectionBannerShown=true;
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      leading: const Icon(
        Icons.wifi_off,
        color: Colors.black,
      ),
      contentTextStyle: const TextStyle(color: Colors.black),
      content: const Text("Keine Verbindung zum Server"),
      dividerColor: Colors.transparent,
      actions: [
        Builder(builder: (BuildContext sContext) {
          return IconButton(
            onPressed: () {
              clearMissingConnectionBanner(sContext);
            },
            icon: const Icon(Icons.close),
            color: Colors.black,
          );
        })
      ],
      backgroundColor: Get.find<AESTheme>().yellow,
    ));
}

  static void clearMissingConnectionBanner(BuildContext context){
    missingConnectionBannerShown=false;
    ScaffoldMessenger.of(context).clearMaterialBanners();
  }

  static void _processResponse(bool available){
    BuildContext context = Get.context!;
    if(!available&&recheckServerTimer==null){
      recheckServerTimer = Timer.periodic(const Duration(seconds: 10), (timer)async {
        bool connection = await API.checkConnection();
        _processResponse(connection);
      });
    }else if(!available&&!missingConnectionBannerShown){
      if (context.mounted)showMissingConnectionBanner(context);
    }else if(available&&missingConnectionBannerShown){
      if (context.mounted)clearMissingConnectionBanner(context);
    }else if(available&&recheckServerTimer!=null){
      recheckServerTimer?.cancel();
      recheckServerTimer=null;
    }
  }

  static Timer? recheckServerTimer;
  static bool missingConnectionBannerShown = false;
  static Future<bool> checkServer()async{
    bool works = await API.checkConnection();
    _processResponse(works);
    return works;
  }

  static DeviceType getDeviceType (BuildContext context){
    return context.responsiveValue(mobile: DeviceType.mobile, watch: DeviceType.watch, tablet: DeviceType.tablet, desktop: DeviceType.desktop);
  }


}

enum DeviceType{
  mobile, desktop, watch, tablet
}
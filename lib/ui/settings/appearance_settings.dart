import 'dart:io';

import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/static/app.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart' as hive;

import 'package:aesapp/static/hive.dart';
class AppearanceSettings extends StatefulWidget {
  const AppearanceSettings({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<AppearanceSettings> createState() => _AppearanceSettingsState();
}

class _AppearanceSettingsState extends State<AppearanceSettings> {
  hive.Box box = hive.Hive.box(HiveKeys.boxName);
  late bool materialYouEnabled;
  Future<bool> supportMaterialYou = (((!kIsWeb)&&Platform.isAndroid)?DeviceInfoPlugin().androidInfo.then((value) => value.version.sdkInt):Future.value(0)).then((value) => value>30);

  @override
  void initState() {
    super.initState();
  }

  Future setMaterialYouEnabled(changeTo)async{
    if(changeTo){
      box.put(HiveKeys.settings.appearance.materialYouColorValue, (await DynamicColorPlugin.getCorePalette().then((value) => value?.primary.get(40)))??(context.mounted?Theme.of(context).colorScheme.primary.value:Get.find<AESTheme>().pink.value));
    }
    box.put(HiveKeys.settings.appearance.materialYouEnabled, changeTo);
    Get.changeTheme(AESAppUtils.getTheme());
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    materialYouEnabled = box.get(HiveKeys.settings.appearance.materialYouEnabled)??false;
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Aussehen"):null,
      body: ListView(
        children: [
          FutureBuilder(
              future: supportMaterialYou,
              builder: (BuildContext context, AsyncSnapshot<bool> snap){
                  return Column(
                    children: [
                      if(snap.hasData&&snap.data!)
                      ListTile(
                        title: const Text("MaterialYou"),
                        textColor: Theme.of(context).colorScheme.primary,
                      ),
                      if(snap.hasData&&snap.data!)
                      SwitchListTile(
                          title: const Text("MaterialYou nutzen?"),
                          subtitle: const Text("Passe an System an (Android 12+)"),
                          value: materialYouEnabled, onChanged: setMaterialYouEnabled
                      ),
                    ],
                  );

              })

        ],
      ),
    );
  }
}

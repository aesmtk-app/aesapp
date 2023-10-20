import 'package:aesapp/static/app.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:aesapp/static/hive.dart';
class DebugSettings extends StatefulWidget {
  const DebugSettings({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<DebugSettings> createState() => _DebugSettingsState();
}

class _DebugSettingsState extends State<DebugSettings> {
  Box box = Hive.box(HiveKeys.boxName);
  late bool enabled;

  @override
  void initState() {
    enabled = box.get(HiveKeys.settings.debugging.enabled)??false;
    super.initState();
  }

  Future setEnabled(bool changeTo)async{
    setState(() {
      enabled = changeTo;
    });
    box.put(HiveKeys.settings.debugging.enabled, enabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isPortrait||(!widget.calledAsWidget)?CustomAppBar.get(title: "Debugging"):null,
      body: ListView(
        children: [
          ListTile(
            title: Text("Debugging-Einstellungen"),
            textColor: Theme.of(context).colorScheme.primary,
          ),
          SwitchListTile(
            title: Text("Debugging-Eintellungen eingeschaltet?"),
            value: enabled,
            onChanged: setEnabled,
            thumbColor: MaterialStateProperty.resolveWith((states) => AESAppUtils.getSwitchThumbColor(states)),

          )
        ],
      ),
    );
  }
}

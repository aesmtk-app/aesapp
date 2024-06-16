import 'dart:convert';

import 'package:aesapp/helpers/app.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:aesapp/helpers/hive.dart';
import 'package:logging/logging.dart';
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
    enabled = box.get(HiveKeys.settings.debugging.enabled)??false;

    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Debugging"):null,
      body: ListView(
        children: [
          ListTile(
            title: const Text("Debugging-Einstellungen"),
            textColor: Theme.of(context).colorScheme.primary,
          ),
          SwitchListTile(
            title: const Text("Debugging-Eintellungen eingeschaltet?"),
            value: enabled,
            onChanged: setEnabled,
            thumbColor: WidgetStateProperty.resolveWith((states) => AESAppUtils.getSwitchThumbColor(states)),

          ),
          ListTile(
            title: const Text("API-Endpoint"),
            subtitle: Text(box.get(HiveKeys.apiEndpoint)),
            onTap: ()=>Get.dialog(const APIEndpointDialog()).then((value) {setState(() {});}),
          ),
          ListTile(
            title: const Text("Speicher zurücksetzen"),
            trailing: ElevatedButton(child: const Text("Reset"),onPressed: ()async=>await HiveKeys.reset().then((value){setState(() {});}),),
          ),
          ListTile(
            title: const Text("Logs anzeigen"),
            trailing: ElevatedButton(child: const Text("Show"),onPressed: ()=>Get.to(Scaffold(appBar: AppBar(),body: ListView.builder(itemCount: Get.find<List<LogRecord>>(tag: "logs").length, itemBuilder: (BuildContext context, int i){LogRecord record = Get.find<List<LogRecord>>(tag:"logs")[i];return Text('${record.loggerName}: ${record.level.name}: ${record.time}: ${record.message}');}),)),),
          ),
        ],
      ),
    );
  }
}

class APIEndpointDialog extends StatefulWidget {
  const APIEndpointDialog({super.key});

  @override
  State<APIEndpointDialog> createState() => _APIEndpointDialogState();
}

class _APIEndpointDialogState extends State<APIEndpointDialog> {
  final Box box = Hive.box(HiveKeys.boxName);
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _urlController;
  @override
  void initState() {
    _urlController = TextEditingController(text: box.get(HiveKeys.apiEndpoint));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      actions: [
        ElevatedButton(onPressed: ()=>Get.back(), child: const Text("Abbrechen")),
        ElevatedButton(
            onPressed: (){
              if (_formKey.currentState!.validate()) {
                box.put(HiveKeys.apiEndpoint, _urlController.text);
                Get.back();
              }
            },
            child: const Text("Speichern")
        )
      ],
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _urlController,
              validator: (value){
                if(value==null||value.isEmpty){
                  return "Url eingeben";
                }
                if(!(Uri.tryParse(_urlController.text)?.isAbsolute??false)){
                  return "Keine Url!";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}


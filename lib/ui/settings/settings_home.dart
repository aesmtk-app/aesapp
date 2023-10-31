
import 'package:aesapp/static/app.dart';
import 'package:aesapp/ui/settings/appearance_settings.dart';
import 'package:aesapp/ui/settings/debug_settings.dart';
import 'package:aesapp/ui/settings/notification_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../aesapp/appbar.dart';
class SettingsHome extends StatefulWidget {
  const SettingsHome({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<SettingsHome> createState() => _SettingsHomeState();
}
class SettingsCategory{
  SettingsCategory({required this.icon, required this.title, required this.description, required this.routeName, required this.page});
  Icon icon;
  String title;
  String description;
  String routeName;
  Widget Function({bool asWidget}) page;

  static List<SettingsCategory> categories = [
    SettingsCategory(icon: const Icon(Icons.palette), title: "Design & Aussehen", description: "Erscheinungsbild anpassen", routeName: "/settings/appearance", page: ({bool asWidget=false})=>AppearanceSettings(calledAsWidget: asWidget,)),
    SettingsCategory(icon: const Icon(Icons.message), title: "Benachrichtungen", description: "Benachrictigungen verwalten", routeName: "/settings/notifications", page: ({bool asWidget=false})=>NotificationSettings(calledAsWidget: asWidget,)),
    SettingsCategory(icon: const Icon(Icons.bug_report), title: "Debugging", description: "Debugging-Einstellungen", routeName: "/settings/debugging", page: ({bool asWidget=false})=>DebugSettings(calledAsWidget: asWidget,))
  ];
}

class _SettingsHomeState extends State<SettingsHome> {
  Widget _selectedPage = const SelectCategory();
  double flexFactor=1000;
  void _onCategorySelect(SettingsCategory category){
    if (context.isLandscape){
      setState(() {
        _selectedPage = category.page(asWidget:true);
      });
    }
    else{
      Get.toNamed(category.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Einstellungen"):null,
      body: Row(
        children: [
          Flexible(
            flex: 700,
            child: ListView.builder(
                itemCount: SettingsCategory.categories.length,

                itemBuilder: (BuildContext context, int index){
                  SettingsCategory e = SettingsCategory.categories[index];
                  return ListTile(leading: e.icon, title: Text(e.title), subtitle: Text(e.description), onTap: ()=>_onCategorySelect(e),);
                }
            ),

          ),
          if (context.isLandscape)
            const VerticalDivider(),
          if (context.isLandscape)
            Flexible(flex: AESAppUtils.getLandscapeSecondFlexFactor(context),child: _selectedPage,)
        ],
      ),
    );
  }
}
class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Benachrichtungskategorie auswählen"),);
  }
}

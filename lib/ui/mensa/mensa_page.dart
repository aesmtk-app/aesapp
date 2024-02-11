// import 'dart:html';
// import 'dart:ui_web' as ui_web;
import 'package:aesapp/objects/mensa.dart';
import 'package:aesapp/helpers/api.dart';
import 'package:aesapp/ui/mensa/menu_card.dart';
import 'package:aesapp/ui/mensa/menu_details.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/date_week_extensions.dart';

import '../../helpers/app.dart';
import '../aesapp/appbar.dart';
class MensaPage extends StatefulWidget {
  const MensaPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<MensaPage> createState() => _MensaPageState();
}

class _MensaPageState extends State<MensaPage> {
  Future<List<Menu>> menus = Get.find<API>().getAllMenus();
  Menu? selectedMenu;
  Widget detailedMenu = const Center(child: Text("Wähle ein Datum"),);



  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Widget? iframeWidget;
    if(kIsWeb){
      /*
      final IFrameElement viewFrame = IFrameElement();
      viewFrame.src = "https://aws1313.de";
      ui_web.platformViewRegistry.registerViewFactory("iframeElement", (int viewId)=>viewFrame);
      iframeWidget = HtmlElementView(key: UniqueKey(), viewType: "iframeElement");
      */
    }

    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Mensa"):null,
      body: (kIsWeb)?iframeWidget:FutureBuilder(
        future: menus,
        builder: (BuildContext context, AsyncSnapshot<List<Menu>> snap){
          if (snap.hasData){
            List<Menu> sortedMenus = snap.data!.sorted((a, b) => a.date.compareTo(b.date));

            if(context.isPortrait){
              return ListView.builder(
                  itemCount: sortedMenus.length,
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AESAppUtils.dateFormat.format(sortedMenus[index].date), textAlign: TextAlign.start,),
                        MenuCard(menu: sortedMenus[index])
                      ],
                    );
                  }
              );
            }else{
              Map<int,List<Menu>> menusByWeek = groupBy(sortedMenus, (p0) => p0.date.weekOfYear);
              menusByWeek = Map.fromEntries(menusByWeek.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
              return Row(
                children: [
                  Flexible(
                    flex: 550,
                    child: ListView(
                      children: menusByWeek.values.map((e) => Column(
                        children: [
                          ListTile(title: Text("KW ${e.first.date.weekOfYear}"), textColor: Theme.of(context).colorScheme.primary,),
                          ...e.map((f) => ListTile(
                            title: Text(AESAppUtils.dateFormat.format(f.date)),
                            onTap: ()async{
                              setState(() {
                                selectedMenu=f;
                                detailedMenu=MenuDetails(menu: f, key: ValueKey(f),);
                              });
                            },
                            selected: f==selectedMenu,
                          ))
                        ],)).toList(),
                    )

                  ),
                  if (context.isLandscape)
                    const VerticalDivider(),
                  if (context.isLandscape)
                    Flexible(
                      flex: AESAppUtils.getLandscapeSecondFlexFactor(context),
                      child: detailedMenu,
                    )
                ],
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

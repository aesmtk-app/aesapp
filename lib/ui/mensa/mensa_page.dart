import 'package:aesapp/objects/mensa.dart';
import 'package:aesapp/static/api.dart';
import 'package:aesapp/ui/mensa/menu_card.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/date_week_extensions.dart';

import '../../static/app.dart';
import '../aesapp/appbar.dart';
class MensaPage extends StatefulWidget {
  const MensaPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<MensaPage> createState() => _MensaPageState();
}

class _MensaPageState extends State<MensaPage> {
  Future<List<Menu>> menus = Dio().get(API.apiEndpoint+API.mensa).then((value) => (value.data as List).map((value) => Menu.fromJSON(value)).toList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Home"):null,
      body: FutureBuilder(
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
                          ...e.map((f) => ListTile(title: Text(AESAppUtils.dateFormat.format(f.date)),))
                        ],)).toList(),
                    )

                  ),
                  if (context.isLandscape)
                    const VerticalDivider(),
                  if (context.isLandscape)
                    Flexible(flex: AESAppUtils.getLandscapeSecondFlexFactor(context),child: const Placeholder(),)
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

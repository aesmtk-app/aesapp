import 'package:aesapp/objects/mensa.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({required this.menu, super.key});
  final Menu menu;

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  late Menu menu;
  String? selectedMeal;
  @override
  void initState() {
    menu=widget.menu;
    super.initState();
  }
  Widget _text(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    child: Text(
      text,
      softWrap: true,
      maxLines: 7,
      textAlign: TextAlign.center,
    ),
  );

  Future onSelect(String? cat)async{
    await menu.orderMeal(context, cat);
    setState(() {
      selectedMeal=cat;
    });
  }
  BorderRadius? getCardRadius(MenuOption? m, List<MenuOption>? ms){
    if (m==null||ms==null) return null;
    if (ms.indexOf(m)==0) return const BorderRadius.only(topLeft: Radius.circular(12));
    if (ms.reversed.toList().indexOf(m)==0) return const BorderRadius.only(topRight: Radius.circular(12));
    return null;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> selectWidgets = [];
    for (final (i,m) in menu.equalSelectableMenus!.indexed){
      if (i!=0) selectWidgets.add(const VerticalDivider(width: 1, thickness: 1,));
      selectWidgets.add(Expanded(child: _text(m.menu)));
    }
    List<Widget> otherSW = [];
    if(selectWidgets.isNotEmpty) otherSW.add(Divider(thickness: 1, height: 1,));
    for (final (i,m) in menu.otherSelectableMenus!.indexed){
      otherSW.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Container(
            color:(m.category==selectedMeal)?Theme.of(context).colorScheme.primary.withOpacity(0.5):null,
            child: GestureDetector(
              onTap: ()=>onSelect(m.category),
              child: _text(m.menu),
            ),
          ))
    ],
      ));
      if(i!=menu.otherSelectableMenus!.length-1)otherSW.add(const Divider(height: 1, thickness: 1,));
    }
    Widget? lastW;
    if(menu.otherMenus!.isNotEmpty){
      lastW = _text(menu.otherMenus!.last.menu);
    }
    List<Widget> otherW = [];
    if(menu.otherMenus!.isNotEmpty&&(otherSW.isNotEmpty||(otherSW.isEmpty&&selectWidgets.isNotEmpty))) otherW.add(const Divider(thickness: 1, height: 1,));
    if(menu.otherMenus!.isNotEmpty){
      for (final (i,m) in menu.otherMenus!.take(menu.otherMenus!.length-1).indexed){
        otherW.add(_text(m.menu));
        if(i!=menu.otherMenus!.length-1)otherW.add(const Divider(height: 1, thickness: 1,));
      }
    }
    return Card(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
              child: Stack(
                children: [
                  Row(
                    children: menu.equalSelectableMenus!.map((e) => Expanded(
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: getCardRadius(e, menu.equalSelectableMenus),
                              color:(e.category==selectedMeal)?Theme.of(context).colorScheme.primary.withOpacity(0.5):null,
                            ),
                          ),
                          onTap: ()=>onSelect(e.category),
                        )
                    )).toList(),
                  ),
                  Row(
                    children: selectWidgets.isEmpty?[Expanded(child: _text("Kein Essen"))]:selectWidgets,
                  ),
                  Row(
                    children: menu.equalSelectableMenus!.map((e) => Expanded(
                      child: GestureDetector(onTap: ()=>onSelect(e.category),),
                    )).toList(),
                  )
                ],
              )
          ),
          ...otherSW,
          ...otherW,
          Padding(
            padding: lastW!=null?EdgeInsets.all(10):EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                lastW ?? Container(),
                ElevatedButton(onPressed: ()async=>await onSelect(null), child: Text("Stornieren")),
              ],
            ),
          )
        ],
      ),
    );
  }
}


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

  void onSelect(String? cat){
    setState(() {
      selectedMeal=cat;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> selectWidgets = [];
    for (final (i,m) in menu.selectableMenus.indexed){
      if (i!=0) selectWidgets.add(const VerticalDivider(width: 0, thickness: 0,));
      selectWidgets.add(Expanded(child: _text(m.menu)));
    }
    List<Widget> otherW = [];
    if(selectWidgets.isNotEmpty) otherW.add(Divider(thickness: 0, height: 0,));
    for (final (i,m) in menu.otherMenus.indexed){
      otherW.add(_text(m.menu));
      if(i!=menu.otherMenus.length-1)otherW.add(const Divider(height: 0, thickness: 0,));
    }
    return Card(
      elevation: 0,
      child: Column(
        children: [
          IntrinsicHeight(
              child: Stack(
                children: [
                  Row(
                    children: menu.selectableMenus.map((e) => Expanded(
                        child: GestureDetector(
                          child: Container(

                            color: (e.category==selectedMeal)?Theme.of(context).colorScheme.primary.withOpacity(0.5):null,
                          ),
                          onTap: ()=>onSelect(e.category),
                        )
                    )).toList(),
                  ),
                  Row(
                    children: selectWidgets.isEmpty?[Expanded(child: _text("Kein Essen"))]:selectWidgets,
                  ),
                  Row(
                    children: menu.selectableMenus.map((e) => Expanded(
                      child: GestureDetector(onTap: ()=>onSelect(e.category),),
                    )).toList(),
                  )
                ],
              )
          ),
          ...otherW,
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 4),
                child: ElevatedButton(onPressed: ()async=>await menu.orderMeal(context, null), child: Text("Stornieren")),
              )
          )
        ],
      ),
    );
  }
}


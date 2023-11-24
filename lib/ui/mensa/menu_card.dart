import 'package:aesapp/objects/mensa.dart';
import 'package:flutter/material.dart';
class MenuCard extends StatelessWidget {
  const MenuCard({required this.menu, super.key});
  final Menu menu;

  Widget _text(String text) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        text,
        softWrap: true,
        maxLines: 7,
        textAlign: TextAlign.center,
      ),
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> selectWidgets = [];
    for (final (i,m) in menu.selectableMenus.indexed){
      if (i!=0) selectWidgets.add(const VerticalDivider(width: 0, thickness: 0,));
      selectWidgets.add(Expanded(child: _text(m.menu)));
    }
    List<Widget> otherW = [];
    for (final (i,m) in menu.otherMenus.indexed){
      if (!(i==0&&selectWidgets.isEmpty)) otherW.add(const Divider(height: 0, thickness: 0,));
      otherW.add(_text(m.menu));
    }
      return Card(
        elevation: 0,
        child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: selectWidgets.isEmpty?[Expanded(child: _text("Kein Essen"))]:selectWidgets,),
              ),
              ...otherW
            ],
          ),
      );
  }
}

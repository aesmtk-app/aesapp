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
      return Card(
        elevation: 0,
        child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(child: _text(menu.normal??"Kein Essen"),),
                    if(menu.veggie!=null)
                      const VerticalDivider(width: 0, thickness: 0,),
                    if(menu.veggie!=null)
                      Expanded(child: _text(menu.veggie!)),
                    if(menu.pasta!=null)
                      const VerticalDivider(width: 0, thickness: 0,),
                    if(menu.pasta!=null)
                      Expanded(child: _text(menu.pasta!))

                  ],),
              ),
              if(menu.dessert!=null)
                const Divider(height: 0,thickness: 0,),
              if(menu.dessert!=null)
                _text(menu.dessert!)
            ],
          ),
      );
  }
}

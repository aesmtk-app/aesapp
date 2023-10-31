import 'package:aesapp/objects/mensa.dart';
import 'package:flutter/material.dart';
class MenuCard extends StatelessWidget {
  const MenuCard({required this.menu, super.key});
  final Menu menu;

  @override
  Widget build(BuildContext context) {
      return Card(
        elevation: 0,
        child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(child: Text(menu.normal??"Kein Essen", maxLines: 5, softWrap: true, textAlign: TextAlign.center,),),
                    if(menu.veggie!=null)
                      const VerticalDivider(width: 0, thickness: 0,),
                    if(menu.veggie!=null)
                      Expanded(child: Text(menu.veggie!,  maxLines: 5, softWrap: true, textAlign: TextAlign.center,)),
                    if(menu.pasta!=null)
                      const VerticalDivider(width: 0, thickness: 0,),
                    if(menu.pasta!=null)
                      Expanded(child: Text(menu.pasta!,  maxLines: 5, softWrap: true, textAlign: TextAlign.center,))

                  ],),
              ),
              if(menu.dessert!=null)
                const Divider(height: 0,thickness: 0,),
              if(menu.dessert!=null)
                Text(menu.dessert!,  maxLines: 5, softWrap: true, textAlign: TextAlign.center,)
            ],
          ),
      );
  }
}

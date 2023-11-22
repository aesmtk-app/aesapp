import 'package:aesapp/objects/mensa.dart';
import 'package:flutter/material.dart';
class MenuDetails extends StatefulWidget {
  final Menu menu;
  const MenuDetails({required this.menu, super.key});

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  Widget selectableDish(String category, String? menu){
    if(menu!=null){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Checkbox(value: false, onChanged: (v){}),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(category, style: Theme.of(context).textTheme.titleLarge,),
              Text(menu, maxLines: 5,)
            ],
          ))
        ],
      );
    }
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.menu.dessert);
    Menu menu = widget.menu;
    return Column(
      children: [
        selectableDish("Normal", menu.normal),
        selectableDish("Vegetarisch", menu.veggie),
        selectableDish("Pasta", menu.pasta),
      ],
    );
  }
}
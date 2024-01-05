import 'package:aesapp/objects/mensa.dart';
import 'package:flutter/material.dart';
class MenuDetails extends StatefulWidget {
  final Menu menu;
  const MenuDetails({required this.menu, super.key});

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  String? selectedMenu;
  Widget selectableDish(String category, String? menu){
    if(menu!=null){
      return RadioListTile(
          value: category,
          groupValue: selectedMenu,
          onChanged: (v)async{
            await widget.menu.orderMeal(context, category);
            setState(() {
              selectedMenu=v;
            });
          },
          title: Text(category),
        subtitle: Text(menu),
      );
    }
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    Menu menu = widget.menu;
    return ListView(
      children: [
        if(menu.equalSelectableMenus!.isNotEmpty)
        ListTile(title: Text("Essensauswahl:", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary),),),
        RadioListTile(
          value: null,
          groupValue: selectedMenu,
          onChanged: (v)async{
            await widget.menu.orderMeal(context, null);
            setState(() {
              selectedMenu=v;
            });
          },
          title: const Text("Kein Essen/Abbestellen"),
        ),
        ...menu.equalSelectableMenus!.map((e) => selectableDish(e.category, e.menu)),
        ...menu.otherSelectableMenus!.map((e) => selectableDish(e.category, e.menu)),
      if(menu.otherMenus!.isNotEmpty)
        const Divider(),
        if(menu.otherMenus!.isNotEmpty)
          ListTile(title: Text("Weiteres:", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary),),),
        ...menu.otherMenus!.map((e) => ListTile(title: Text(e.category), subtitle: Text(e.menu),))
      ],
    );
  }
}
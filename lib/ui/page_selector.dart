import 'package:aesapp/main.dart';
import 'package:aesapp/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page{
  Page({required this.index, required this.label, required this.icon, required this.selectedIcon, required this.showWhenPortrait, required this.showWhenLandscape, required this.content});
  String label;
  int index;
  Icon icon;
  Icon selectedIcon;
  bool showWhenPortrait;
  bool showWhenLandscape;
  Widget content;
}

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  List<Page> pages = [
    Page(index: 0, label: "Home", icon: const Icon(Icons.home), selectedIcon: const Icon(Icons.home_outlined), showWhenPortrait: true, content: const HomePage(), showWhenLandscape: true),
    Page(index: 1, label: "Vertretung", icon: const Icon(Icons.table_chart), selectedIcon: const Icon(Icons.table_chart_outlined), showWhenPortrait: true, content: Container(), showWhenLandscape: true)
  ];
  int _selectedPageIndex = 0;
  bool isPortrait = true;

  void _changePage(int changeTo){
    setState(() {
      _selectedPageIndex = changeTo;
    });
  }

  Widget get menuButton => Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,

      );
    },
  );

  AppBar get appBar => AppBar(
    title: Text(MediaQuery.of(context).orientation.name),
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    leading: isPortrait?menuButton:Container(),
    systemOverlayStyle: SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  NavigationBar get bottomNavigationBar => NavigationBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    surfaceTintColor: Theme.of(context).colorScheme.surface,
    destinations: pages.where((element) => element.showWhenPortrait).map((e) => NavigationDestination(
      icon: e.icon,
      label: e.label,
      selectedIcon: e.selectedIcon,
    )).toList(),
    onDestinationSelected: _changePage,
    selectedIndex: _selectedPageIndex,
  );

  NavigationRail get navigationRail => NavigationRail(
    backgroundColor: Theme.of(context).colorScheme.surface,

    destinations: pages.where((element) => element.showWhenLandscape).map((e) => NavigationRailDestination(
        icon: e.icon,
        label: Text(e.label)
      )).toList(),
      onDestinationSelected: _changePage,
      selectedIndex: _selectedPageIndex,
      labelType: NavigationRailLabelType.all,
      leading: menuButton,
  );

  NavigationDrawer get navigationDrawer => NavigationDrawer(
      children: [
        ...pages.map((e) => ListTile(
          leading: e.icon,
          title: Text(e.label),
          onTap: (){
            Navigator.pop(context);
            setState(() {
              _selectedPageIndex=e.index;
            });
          },
        ))
      ]
  );

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isPortrait?appBar:null,
      bottomNavigationBar: isPortrait? bottomNavigationBar:null,
      drawer: navigationDrawer,
      body: SafeArea(
          child: Row(
            children: [
              isPortrait?Container():navigationRail,
              pages[_selectedPageIndex].content,
            ],
          )
      ),
    );
  }
}

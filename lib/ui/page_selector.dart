import 'package:aesapp/main.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/homepage.dart';
import 'package:aesapp/ui/settings/settings_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Page{
  Page({ required this.id, required this.label, required this.icon, required this.selectedIcon, required this.showWhenPortrait, required this.showWhenLandscape, required this.content});
  String label;
  int id;
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
  Map<int, Page> defaultPages = {
    0:Page(id: 0, label: "Home", icon: const Icon(Icons.home), selectedIcon: const Icon(Icons.home_outlined), showWhenPortrait: true, content: const HomePage(), showWhenLandscape: true),
    1:Page(id: 1, label: "Vertretung", icon: const Icon(Icons.table_chart), selectedIcon: const Icon(Icons.table_chart_outlined), showWhenPortrait: true, content: Container(), showWhenLandscape: true),
    2:Page(id: 2, label: "test", icon: const Icon(Icons.table_chart), selectedIcon: const Icon(Icons.table_chart_outlined), showWhenPortrait: false, content: Container(child: Text("teet"),), showWhenLandscape: false),
    99:Page(id: 99, label: "Settings", icon: const Icon(Icons.settings), selectedIcon: const Icon(Icons.settings_outlined), showWhenPortrait: true, showWhenLandscape: true, content: const SettingsHome())
  };
  List<Page> pages = [];

  @override
  void initState() {
    pages = defaultPages.values.where((element) => element.showWhenLandscape).toList();
    super.initState();
  }
  int _selectedPageIndex = 0;
  int _selectedPageId = 0;
  bool isPortrait = true;
  bool _isRailForwarded = false;


  void _changePage(int changeTo){
    setState(() {
      _selectedPageIndex = changeTo;
      _selectedPageId = defaultPages.values.firstWhere((element) => pages[changeTo].id==element.id).id;
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
    leading: _isRailForwarded?null:(isPortrait?menuButton:Container()),
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
      children: defaultPages.map((key, value) => MapEntry(key, ListTile(
        leading: value.icon,
        title: Text(value.label),
        onTap: (){
          Navigator.pop(context);
          if(pages.contains(value)){
            setState(() {
              _selectedPageId=key;
              _selectedPageIndex=0;
              Page? p = pages.firstWhereOrNull((element) => element.id==key);
              _selectedPageIndex = p==null?0:pages.indexOf(p);
            });
          }
          else{
            _isRailForwarded = true;
            Get.to(()=>Scaffold(body: value.content, appBar: CustomAppBar.get(isRailForwarded: _isRailForwarded, title: value.label),))?.whenComplete(() => _isRailForwarded = false);
          }
        },)
      )).values.toList()

  );

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isPortrait?CustomAppBar.get(isRailForwarded: _isRailForwarded):null,
      bottomNavigationBar: isPortrait? bottomNavigationBar:null,
      drawer: navigationDrawer,
      body: SafeArea(
          child: Row(
            children: [
              isPortrait?Container():navigationRail,
              defaultPages[_selectedPageId]!.content,
            ],
          )
      ),
    );
  }
}

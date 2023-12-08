import 'package:aesapp/static/app.dart';
import 'package:aesapp/ui/TestPage.dart';
import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:aesapp/ui/homepage.dart';
import 'package:aesapp/ui/mensa/mensa_page.dart';
import 'package:aesapp/ui/settings/settings_home.dart';
import 'package:aesapp/ui/vplan/vplan_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Logger logger = Logger("PageSelector");
class AESPage{
  AESPage({ required this.id, required this.label, required this.icon, required this.selectedIcon, required this.showWhenPortrait, required this.showWhenLandscape, required this.page, required this.routeName});
  String label;
  int id;
  Icon icon;
  Icon selectedIcon;
  bool showWhenPortrait;
  bool showWhenLandscape;
  Widget Function({bool asWidget}) page;
  String routeName;
  

  static Map<int, AESPage> defaultPages = {
    0:AESPage(id: 0, label: "Home", icon: const Icon(Icons.home), selectedIcon: const Icon(Icons.home_outlined), showWhenPortrait: true, page: ({bool asWidget=false})=> HomePage(calledAsWidget: asWidget,), showWhenLandscape: true, routeName: "/home"),
    1:AESPage(id: 1, label: "Vertretung", icon: const Icon(Icons.table_chart), selectedIcon: const Icon(Icons.table_chart_outlined), showWhenPortrait: true, page: ({bool asWidget=false})=>VPlanPage(calledAsWidget: asWidget,), showWhenLandscape: true, routeName: "/vplan"),
    3:AESPage(id: 3, label: "Mensa", icon: const Icon(Icons.restaurant_menu), selectedIcon: const Icon(Icons.restaurant_menu_outlined), showWhenPortrait: true, showWhenLandscape: true, page: ({bool asWidget=false})=>MensaPage(calledAsWidget: asWidget,), routeName: "/mensa"),
    2:AESPage(id: 2, label: "test", icon: const Icon(Icons.table_chart), selectedIcon: const Icon(Icons.table_chart_outlined), showWhenPortrait: false, page: ({bool asWidget=false})=>TestPage(calledAsWidget: asWidget,), showWhenLandscape: false, routeName: "/test"),
    99:AESPage(id: 99, label: "Settings", icon: const Icon(Icons.settings), selectedIcon: const Icon(Icons.settings_outlined), showWhenPortrait: true, showWhenLandscape: true, page: ({bool asWidget=false})=>SettingsHome(calledAsWidget: asWidget,), routeName: "/settings")
  };
}

class RootPageSelector extends StatefulWidget {
  const RootPageSelector({super.key});

  @override
  State<RootPageSelector> createState() => _RootPageSelectorState();
}

class _RootPageSelectorState extends State<RootPageSelector> with WidgetsBindingObserver {

  List<AESPage> pages = [];

  @override
  void initState() {
    pages = AESPage.defaultPages.values.where((element) => element.showWhenLandscape).toList();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AESAppUtils.checkServer().then((value) => null);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      logger.info("changed network");
    });
    logger.info("init");
  }
  int _selectedPageIndex = 0;
  int _selectedPageId = 0;
  bool isPortrait = true;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if (state==AppLifecycleState.resumed){
      AESAppUtils.checkServer().then((value) => null);
    }
  }
  @override
  void dispose(){
    super.dispose();
    logger.info("dispose");
    WidgetsBinding.instance.removeObserver(this);
  }


  void _changePage(int changeTo){
    setState(() {
      _selectedPageIndex = changeTo;
      _selectedPageId = AESPage.defaultPages.values.firstWhere((element) => pages[changeTo].id==element.id).id;
    });
  }

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
      leading: CustomAppBar.menuButton(),
  );

  NavigationDrawer get navigationDrawer => NavigationDrawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      children: AESPage.defaultPages.map((key, value) => MapEntry(key, ListTile(
        leading: value.icon,
        title: Text(value.label),
        onTap: (){
          Navigator.pop(context);
          if(pages.contains(value)){
            setState(() {
              _selectedPageId=key;
              _selectedPageIndex=0;
              AESPage? p = pages.firstWhereOrNull((element) => element.id==key);
              _selectedPageIndex = p==null?0:pages.indexOf(p);
            });
          }
          else{
            Get.toNamed(value.routeName);
          }
        },)
      )).values.toList()

  );

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isPortrait?CustomAppBar.get():null,
      bottomNavigationBar: isPortrait? bottomNavigationBar:null,
      drawer: navigationDrawer,
      body: Row(
            children: [
              isPortrait?Container():navigationRail,
              Expanded(child: SafeArea(child: AESPage.defaultPages[_selectedPageId]!.page(asWidget: true),bottom: false,)),
            ],
      ),
    );
  }
}

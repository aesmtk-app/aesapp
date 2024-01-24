import 'dart:async';
import 'dart:io';
import 'package:aesapp/ui/news/news_page.dart';
import 'package:aesapp/ui/timetable/timetable_page.dart';
import 'package:aesapp/ui/watch/watch_root.dart';
import 'package:flutter/foundation.dart';
import "package:universal_html/html.dart" as html;
import 'package:aesapp/helpers/app.dart';
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
    4:AESPage(id: 4, label: "Plan", icon: const Icon(Icons.table_chart), selectedIcon: const Icon(Icons.table_chart_outlined), showWhenPortrait: true, showWhenLandscape: true, page: ({bool asWidget=false})=>TimetablePage(calledAsWidget: asWidget,), routeName: "/timetable"),
    5:AESPage(id: 5, label: "News", icon: const Icon(Icons.newspaper), selectedIcon: const Icon(Icons.newspaper_outlined), showWhenPortrait: true, showWhenLandscape: true, page: ({bool asWidget=false})=>NewsPage(calledAsWidget: asWidget,), routeName: "/news"),
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
  StreamSubscription? networkSubscription;

  @override
  void initState() {
    pages = AESPage.defaultPages.values.where((element) => element.showWhenLandscape).toList();
    super.initState();
    AESAppUtils.checkServer().then((value) => null);
    networkSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      AESAppUtils.checkServer().then((value) => null);
    });
    if(kIsWeb){
      html.window.addEventListener("focus", webVisibilityChange);
    }else{
      WidgetsBinding.instance.addObserver(this);
    }


    logger.info("init");
  }
  int _selectedPageIndex = 0;
  int _selectedPageId = 0;
  bool isPortrait = true;
  void webVisibilityChange(html.Event e){
    didChangeAppLifecycleState(AppLifecycleState.resumed);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    logger.info(state);
    if (state==AppLifecycleState.resumed){
      AESAppUtils.checkServer().then((value) => null);
    }
  }
  @override
  void dispose(){
    super.dispose();

    logger.info("dispose");
    if(kIsWeb){
      html.window.removeEventListener("focus", webVisibilityChange);

    }else{
      WidgetsBinding.instance.removeObserver(this);
    }
    networkSubscription?.cancel();
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
      if((AESAppUtils.getDeviceType(context)==DeviceType.watch)&&(!kIsWeb)&&Platform.isAndroid) {
        return const WatchRoot();
      }
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
          )
      );
  }
}

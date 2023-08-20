import 'package:flutter/material.dart';

class Page{
  Page({required this.label, required this.icon, required this.selectedIcon, required this.showWhenPortrait, required this.content});
  String label;
  Icon icon;
  Icon selectedIcon;
  bool showWhenPortrait;
  Widget content;
}

class PageSelector extends StatefulWidget {
  const PageSelector({super.key});

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  List<Page> pages = [
    Page(label: "Home", icon: const Icon(Icons.home), selectedIcon: const Icon(Icons.home_outlined), showWhenPortrait: true, content: Text("Hi")),
    Page(label: "Temp", icon: const Icon(Icons.alarm), selectedIcon: const Icon(Icons.alarm_outlined), showWhenPortrait: true, content: Text("temp"))
  ];
  int _selectedPageIndex = 0;

  void _changePage(int changeTo){
    setState(() {
      _selectedPageIndex = changeTo;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text(MediaQuery.of(context).orientation.name),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      bottomNavigationBar: isPortrait? NavigationBar(
        destinations: pages.where((element) => element.showWhenPortrait).map((e) => NavigationDestination(
          icon: e.icon,
          label: e.label,
          selectedIcon: e.selectedIcon,
        )).toList(),
        onDestinationSelected: _changePage,
        selectedIndex: _selectedPageIndex,
      ):null,
      body: pages[_selectedPageIndex].content,
    );
  }
}

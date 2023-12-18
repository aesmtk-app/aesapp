import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';
class TimetablePage extends StatefulWidget {
  const TimetablePage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Stundenplan"):null,
    );
  }
}

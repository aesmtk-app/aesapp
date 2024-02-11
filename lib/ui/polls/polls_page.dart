import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:flutter/material.dart';

class PollsPage extends StatefulWidget {
  const PollsPage({super.key,this.calledAsWidget=false});
  final bool calledAsWidget;

  @override
  State<PollsPage> createState() => _PollsPageState();
}

class _PollsPageState extends State<PollsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Umfragen"):null,
      body: Center(),
    );
  }
}
import 'package:aesapp/objects/mensa.dart';
import 'package:aesapp/static/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../aesapp/appbar.dart';
class MensaPage extends StatefulWidget {
  const MensaPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  State<MensaPage> createState() => _MensaPageState();
}

class _MensaPageState extends State<MensaPage> {
  Future<List<Menu>> menus = Dio().get(API.apiEndpoint+API.mensa).then((value) => (value.data as List).map((value) => Menu.fromJSON(value)).toList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget)?CustomAppBar.get(title: "Home"):null,
      body: FutureBuilder(
        future: menus,
        builder: (BuildContext context, AsyncSnapshot<List<Menu>> snap){
          if (snap.hasData){
            return ListView(
              children: snap.data!.map((e) => Text(e.normal??"Nichts")).toList(),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

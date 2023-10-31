import 'package:aesapp/ui/aesapp/appbar.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TestPage extends StatelessWidget {
  const TestPage({this.calledAsWidget=false, super.key});
  final bool calledAsWidget;

  @override
  Widget build(BuildContext context) {
    String route = Get.currentRoute;
    return Scaffold(
      appBar: CustomAppBar.get(title: "Test"),
      body: Column(
    children:[
      Text("This is a test-page!, you came from: $route"),
      FutureBuilder(future:DynamicColorPlugin.getCorePalette(),
          builder: (BuildContext context, AsyncSnapshot<CorePalette?> snap){
        if(snap.hasData){

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(color: Color(snap.data!.primary.get(80)),),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(color: Color(snap.data!.secondary.get(40)),),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(color: Color(snap.data!.tertiary.get(40)),),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Container(),
                ),
              ],
            )
          );
        }
        return const CircularProgressIndicator();
      })
    ],
      )
    );
  }
}

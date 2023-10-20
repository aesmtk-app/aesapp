import 'package:aesapp/ui/aesapp/appbar.dart';
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
      body: Text("This is a test-page!, you came from: $route"),
    );
  }
}

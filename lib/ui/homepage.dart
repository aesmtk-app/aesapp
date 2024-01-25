import 'package:aesapp/objects/theme.dart';
import 'package:aesapp/helpers/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'aesapp/appbar.dart';

final logger = Logger("home");

class HomePage extends StatefulWidget {
  const HomePage({this.calledAsWidget = false, super.key});

  final bool calledAsWidget;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (!widget.calledAsWidget) ? CustomAppBar.get(title: "Home") : null,
      body: Column(
        children: [
          SizedBox(
            width: 100,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  hintText: "Filter", border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                //AESAppUtils.showErrorToast(Navigator.canPop(context).toString());
                AESAppUtils.showMissingConnectionBanner(context);
                                // send to endpoint
              },
              child: Text("hi")),
        ],
      ),
    );
  }
}

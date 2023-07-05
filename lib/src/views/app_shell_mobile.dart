import 'package:flutter/material.dart';

class AppShellMobile extends StatelessWidget {
  final Widget child;

  const AppShellMobile({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: ListView(
        children: const [Text("data"), Text("data 2")],
      )),
      body: child,
    );
  }
}

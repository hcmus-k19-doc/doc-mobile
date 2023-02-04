
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/common_widgets/menu_drawer.dart';

class BaseScreen extends StatelessWidget {
  final String title;
  const BaseScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
      ),
      drawer: MenuDrawer(),
    );
  }
}

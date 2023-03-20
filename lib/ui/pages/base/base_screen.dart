import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/ui/common_widgets/menu_drawer.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/list_incoming_doc_screen.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/test_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> pages = [const ListIncomingDocScreen(), const TestScreen()];

  int _currentIndex = 0;
  String _title = "Danh sách văn bản đến";

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            style: bodyLargeBold(context)
                ?.copyWith(color: Colors.white, fontSize: 20),
          ),
        ),
        drawer: MenuDrawer(onNewDrawerIndex: setNewDrawerIndex),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: pages,
        ),
      ),
    );
  }

  setNewDrawerIndex(int newIndex, String newTitile) {
    setState(() {
      _currentIndex = newIndex;
      _title = newTitile;
      _pageController.jumpToPage(_currentIndex);
    });
  }
}

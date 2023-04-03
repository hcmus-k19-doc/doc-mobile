import 'package:flutter/material.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/ui/common_widgets/menu_drawer.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/list_incoming_doc_screen.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/test_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [const ListIncomingDocScreen(), const TestScreen()];

  int _currentIndex = 0;
  late String _title;

  late PageController _pageController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
    _title = appLocalizations.mainPage("INCOMING_DOCUMENT_LIST");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            style: headLineSmall(context)?.copyWith(color: Colors.white),
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
      print(newTitile);
      _title = appLocalizations.mainPage(newTitile);
      _pageController.jumpToPage(_currentIndex);
    });
  }
}

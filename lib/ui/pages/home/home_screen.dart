import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_app/ui/common_widgets/menu_drawer.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/list_incoming_doc_screen.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/reminder_calendar_screem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    BlocProvider(
      create: (context) => ListIncomingBloc(
          IncomingDocumentRepository(
              "${UrlConst.DOC_SERVICE_URL}/incoming-documents"),
          SearchCriteria()),
      child: const ListIncomingDocScreen(),
    ),
    const ReminderCalendarScreen()
  ];

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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(MyRouter.login, (route) => false);
        }
      },
      child: SafeArea(
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
      ),
    );
  }

  setNewDrawerIndex(int newIndex, String newTitile) {
    setState(() {
      _currentIndex = newIndex;
      _title = appLocalizations.mainPage(newTitile);
      _pageController.jumpToPage(_currentIndex);
    });
  }
}

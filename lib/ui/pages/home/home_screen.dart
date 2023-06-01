import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/bloc/list_outgoing_bloc/list_outgoing_bloc.dart';
import 'package:flutter_app/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/model/outgoing_search_criteria.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/document_reminder_repository.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_app/repositories/outgoing_document_reposiroty.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/ui/common_widgets/menu_drawer.dart';
import 'package:flutter_app/ui/pages/account/account_screen.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/list_incoming_doc_screen.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/test_screen.dart';
import 'package:flutter_app/ui/pages/list_outgoing_doc/list_outgoing_doc_screen.dart';
import 'package:flutter_app/ui/pages/profile/profile_screen.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/reminder_calendar_screem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badges/badges.dart' as badges;

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
    BlocProvider(
      create: (_) => ListOutgoingBloc(
          OutgoingDocumentRepository(
              "${UrlConst.DOC_SERVICE_URL}/outgoing-documents"),
          OutgoingSearchCriteria()),
      child: const ListOutgoingDocScreen(),
    ),
    BlocProvider(
        create: (BuildContext context) => DocumentReminderBloc(
            DocumentReminderRepository(
                "${UrlConst.DOC_SERVICE_URL}/document-reminders/current-user")),
        child: const ReminderCalendarScreen()),
    const AccountScreen()
  ];

  List<String> listTitle = [
    "INCOMING_DOCUMENT_LIST",
    "OUTGOING_DOCUMENT",
    "REMINDER",
    "ACCOUNT",
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
          // drawer: MenuDrawer(onNewDrawerIndex: setNewDrawerIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Văn bản đến"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.schedule), label: "Văn bản đi"),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.notifications),
                  label: appLocalizations.mainPage("REMINDER")),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Tài khoản"),
            ],
            currentIndex: _currentIndex,
            onTap: _onTapBottomNavigation,
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: pages,
          ),
        ),
      ),
    );
  }

  _onTapBottomNavigation(int index) {
    setState(() {
      _currentIndex = index;
      _title = appLocalizations.mainPage(listTitle[index]);
      _pageController.jumpToPage(_currentIndex);
    });
  }

  setNewDrawerIndex(int newIndex, String newTitile) {
    setState(() {
      _currentIndex = newIndex;
      _title = appLocalizations.mainPage(newTitile);
      _pageController.jumpToPage(_currentIndex);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/app/router.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/document_reminder_bloc/document_reminder_bloc.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/bloc/list_outgoing_bloc/list_outgoing_bloc.dart';
import 'package:flutter_app/bloc/transfer_history_bloc/transfer_history_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/model/outgoing_search_criteria.dart';
import 'package:flutter_app/model/search_criteria.dart';
import 'package:flutter_app/repositories/document_reminder_repository.dart';
import 'package:flutter_app/repositories/incoming_document_repository.dart';
import 'package:flutter_app/repositories/user_repository.dart';
import 'package:flutter_app/ui/pages/account/account_screen.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/list_incoming_doc_screen.dart';
import 'package:flutter_app/ui/pages/list_outgoing_doc/list_outgoing_doc_screen.dart';
import 'package:flutter_app/ui/pages/reminder_calendar/reminder_calendar_screem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badges/badges.dart' as badges;

import '../../../repositories/outgoing_document_repository.dart';

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
    "INCOMING_DOCUMENT",
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
    _title = appLocalizations.mainPage("INCOMING_DOCUMENT");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is UnAuthenticated) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(MyRouter.login, (route) => false);
        }
      },
      child: BlocProvider(
        create: (context) => TransferHistoryBloc(
            UserRepository("${UrlConst.DOC_SERVICE_URL}/users"))
          ..add(FetchNumberTransferHistoryEvent(
              BlocProvider.of<AuthBloc>(context).profile!.id!)),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                _title,
                style: headLineSmall(context)?.copyWith(color: Colors.white),
              ),
              actions: [
                BlocBuilder<TransferHistoryBloc, TransferHistoryState>(
                  builder: (context, transferHistoryState) {
                    return Center(
                      child: badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 0, end: 2),
                        showBadge: BlocProvider.of<TransferHistoryBloc>(context)
                                        .numTransferHistory ==
                                    null ||
                                BlocProvider.of<TransferHistoryBloc>(context)
                                        .numTransferHistory ==
                                    0
                            ? false
                            : true,
                        badgeContent: Text(
                          checkNum(BlocProvider.of<TransferHistoryBloc>(context)
                              .numTransferHistory),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        child: IconButton(
                            icon: const Icon(Icons.notifications),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRouter.transferHistory,
                                  arguments: TransferHistoryArgs(
                                      BlocProvider.of<TransferHistoryBloc>(
                                          context)));
                            }),
                      ),
                    );
                  },
                )
              ],
            ),
            // drawer: MenuDrawer(onNewDrawerIndex: setNewDrawerIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: appLocalizations.mainPage("INCOMING_DOCUMENT")),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.schedule),
                    label: appLocalizations.mainPage("OUTGOING_DOCUMENT")),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.calendar_month),
                    label: appLocalizations.mainPage("REMINDER")),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person),
                    label: appLocalizations.mainPage("ACCOUNT")),
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
      ),
    );
  }

  String checkNum(int? num) {
    if (num == null) {
      return "";
    } else {
      return num > 10 ? "+10" : num.toString();
    }
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

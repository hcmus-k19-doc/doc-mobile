import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_outgoing_bloc/list_outgoing_bloc.dart';
import 'package:flutter_app/bloc/suggestion_bloc/suggestion_bloc.dart';
import 'package:flutter_app/constants/api_const.dart';
import 'package:flutter_app/constants/font_const.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/repositories/suggestion_repository.dart';
import 'package:flutter_app/ui/pages/list_outgoing_doc/widgets/build_outgoing_document.dart';
import 'package:flutter_app/ui/pages/list_outgoing_doc/widgets/outgoing_search_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListOutgoingDocScreen extends StatefulWidget {
  const ListOutgoingDocScreen({Key? key}) : super(key: key);

  @override
  State<ListOutgoingDocScreen> createState() => _ListOutgoingDocScreenState();
}

class _ListOutgoingDocScreenState extends State<ListOutgoingDocScreen> {
  bool _isScrollAble = false;
  late ScrollController scrollController;

  late ListOutgoingBloc listOutgoingBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    listOutgoingBloc = BlocProvider.of<ListOutgoingBloc>(context);
    listOutgoingBloc.add(FetchOutgoingListDocumentEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_isScrollAble &&
        scrollController.position.maxScrollExtent == scrollController.offset) {
      listOutgoingBloc.add(FetchOutgoingListDocumentEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollController,
        child: BlocListener<ListOutgoingBloc, ListOutgoingState>(
          listener: (context, state) {
            if (state is ListOutgoingSuccess) {
              if (!_isScrollAble) {
                final isScrollable =
                    scrollController.position.maxScrollExtent > 0;
                if (_isScrollAble != isScrollable) {
                  _isScrollAble = isScrollable;
                }
                listOutgoingBloc.add(FetchOutgoingListDocumentEvent());
              }
            }
            if (state is ListOutgoingInitial) {
              _isScrollAble = false;
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(StyleConst.defaultPadding20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .mainPage("OUTGOING_DOCUMENT_LIST"),
                      style: headLineSmall(context),
                    ),
                    const SizedBox(
                      width: StyleConst.defaultPadding12,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(
                                        StyleConst.defaultRadius15))),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return MultiBlocProvider(providers: [
                                BlocProvider(
                                    create: (context) => SuggestionBloc(
                                        SuggestionRepository(
                                            UrlConst.DOC_SERVICE_URL))
                                      ..add(FetchSuggestionEvent())),
                                BlocProvider.value(value: listOutgoingBloc)
                              ], child: const OutgoingSearchModal());
                            });
                      },
                      splashFactory: NoSplash.splashFactory,
                      child: Icon(
                        Icons.filter_list_alt,
                        color: Colors.grey[700],
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: StyleConst.defaultPadding8,
                ),
                const BuildListOutgoingDocument()
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_incoming_bloc/list_incoming_bloc.dart';
import 'package:flutter_app/bloc/suggestion_bloc/suggestion_bloc.dart';
import 'package:flutter_app/constants/export_constants.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/repositories/suggestion_repository.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/build_list_document.dart';
import 'package:flutter_app/ui/pages/list_incoming_doc/widgets/seach_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListIncomingDocScreen extends StatefulWidget {
  const ListIncomingDocScreen({Key? key}) : super(key: key);

  @override
  State<ListIncomingDocScreen> createState() => _ListIncomingDocScreenState();
}

class _ListIncomingDocScreenState extends State<ListIncomingDocScreen> {
  int numUnHandle = 0;
  int numCoopHandle = 1;
  int numExpired = 3;
  bool _isScrollAble = false;
  late ScrollController scrollController;

  late ListIncomingBloc listIncomingBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    listIncomingBloc = BlocProvider.of<ListIncomingBloc>(context);
    listIncomingBloc.add(FetchIncomingListDocumentEvent());
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
      listIncomingBloc.add(FetchIncomingListDocumentEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: BlocListener<ListIncomingBloc, ListIncomingState>(
        listener: (context, state) {
          if (state is ListIncomingSuccess) {
            if (!_isScrollAble) {
              final isScrollable =
                  scrollController.position.maxScrollExtent > 0;
              if (_isScrollAble != isScrollable) {
                _isScrollAble = isScrollable;
              }
              listIncomingBloc.add(FetchIncomingListDocumentEvent());
            }
          }
          if (state is ListIncomingInitial) {
            _isScrollAble = false;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.defaultPadding20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hiện tại bạn có:",
                style: headLineSmall(context),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: StyleConst.defaultPadding16,
                    top: StyleConst.defaultPadding8),
                child: RichText(
                  text: TextSpan(
                      style: bodyLarge(context)?.copyWith(fontSize: 20),
                      children: [
                        TextSpan(text: "${numUnHandle} văn bản "),
                        const TextSpan(
                            text: "chưa xử lý\n",
                            style: TextStyle(color: Colors.green)),
                        TextSpan(text: "${numCoopHandle} văn bản "),
                        const TextSpan(
                            text: "cần phối hợp xử lý\n",
                            style: TextStyle(color: Colors.cyan)),
                        TextSpan(text: "${numExpired} văn bản "),
                        const TextSpan(
                            text: "quá hạn\n",
                            style: TextStyle(color: Colors.red)),
                      ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: StyleConst.defaultPadding16),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Danh sách văn bản đến",
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
                                      StyleConst.defaultRadius25))),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return BlocProvider(
                                create: (context) => SuggestionBloc(
                                    SuggestionRepository(
                                        UrlConst.DOC_SERVICE_URL))
                                  ..add(FetchSuggestionEvent()),
                                child: const SearchModal());
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
              const BuildListIncomingDocument(),
            ],
          ),
        ),
      ),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    ListIncomingBloc listIncomingBloc =
        BlocProvider.of<ListIncomingBloc>(context);
    listIncomingBloc.add(FetchIncomingListDocumentEvent());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hiện tại bạn có:",
              style: bodyLargeBold(context)?.copyWith(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: StyleConst.defaultPadding,
                  top: StyleConst.defaultPadding / 2),
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
              padding:
                  EdgeInsets.symmetric(vertical: StyleConst.defaultPadding / 2),
              child: Divider(
                thickness: 2,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Danh sách văn bản đến",
                  style: bodyLargeBold(context)?.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  width: StyleConst.defaultPadding / 2,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top:
                                    Radius.circular(StyleConst.defaultRadius))),
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
              height: StyleConst.defaultPadding / 2,
            ),
            const BuildListIncomingDocument(),
          ],
        ),
      ),
    );
  }
}

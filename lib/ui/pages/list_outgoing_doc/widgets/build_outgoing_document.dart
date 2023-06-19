import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/list_outgoing_bloc/list_outgoing_bloc.dart';
import 'package:flutter_app/constants/style_const.dart';
import 'package:flutter_app/ui/pages/list_outgoing_doc/widgets/outgoing_document_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildListOutgoingDocument extends StatefulWidget {
  const BuildListOutgoingDocument({Key? key}) : super(key: key);

  @override
  State<BuildListOutgoingDocument> createState() =>
      _BuildListOutgoingDocumentState();
}

class _BuildListOutgoingDocumentState extends State<BuildListOutgoingDocument> {
  late ListOutgoingBloc listOutgoingBloc;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listOutgoingBloc = BlocProvider.of<ListOutgoingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListOutgoingBloc, ListOutgoingState>(
        bloc: listOutgoingBloc,
        listener: (context, state) {
          if (state is ListOutgoingInitial) {
            currentPage = 0;
          }
        },
        builder: (context, state) {
          if (state is ListOutgoingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ListOutgoingSuccess) {
            return Column(
              children: listOutgoingBloc.listOutgoingDocument
                  .map((e) => Column(
                        children: [
                          OutgoingDocumentTile(outgoingDocument: e),
                          const SizedBox(
                            height: StyleConst.defaultPadding8,
                          )
                        ],
                      ))
                  .toList(),
            );
          }
          if (state is ListOutgoingFetchMore) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...listOutgoingBloc.listOutgoingDocument.map((e) => Column(
                        children: [
                          OutgoingDocumentTile(outgoingDocument: e),
                          const SizedBox(
                            height: StyleConst.defaultPadding8,
                          )
                        ],
                      )),
                  const CircularProgressIndicator(),
                ]);
          }
          if (state is ListOutgoingEmpty) {
            return Column(children: [
              ...listOutgoingBloc.listOutgoingDocument.map((e) => Column(
                    children: [
                      OutgoingDocumentTile(outgoingDocument: e),
                      const SizedBox(
                        height: StyleConst.defaultPadding8,
                      )
                    ],
                  )),
              Text(AppLocalizations.of(context)!.noData),
            ]);
          }
          if (state is ListOutgoingFailure) {
            return Text(AppLocalizations.of(context)!.failToFetchData);
          }
          return const SizedBox();
        });
  }
}

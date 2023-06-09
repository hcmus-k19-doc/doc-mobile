import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_app/bloc/transfer_history_bloc/transfer_history_bloc.dart';
import 'package:flutter_app/ui/pages/transfer_history/widgets/history_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildListTransfer extends StatefulWidget {
  const BuildListTransfer({Key? key}) : super(key: key);

  @override
  State<BuildListTransfer> createState() => _BuildListTransferState();
}

class _BuildListTransferState extends State<BuildListTransfer> {
  late TransferHistoryBloc transferHistoryBloc;

  bool _isScrollAble = false;
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
    transferHistoryBloc = BlocProvider.of<TransferHistoryBloc>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    print("hello");
    if (_isScrollAble &&
        scrollController.position.maxScrollExtent == scrollController.offset) {
      transferHistoryBloc.add(FetchMoreTransferHistoryEvent(
          BlocProvider.of<AuthBloc>(context).profile!.id!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferHistoryBloc, TransferHistoryState>(
      bloc: transferHistoryBloc,
      listener: (context, state) {
        if (state is TransferHistorySuccess) {
          if (!_isScrollAble) {
            final isScrollable = scrollController.position.maxScrollExtent > 0;
            if (_isScrollAble != isScrollable) {
              _isScrollAble = isScrollable;
            }
            transferHistoryBloc.add(FetchMoreTransferHistoryEvent(
                BlocProvider.of<AuthBloc>(context).profile!.id!));
          }
        }
        if (state is TransferHistoryInitial) {
          _isScrollAble = false;
        }
      },
      builder: (context, state) {
        return ListView.builder(
            controller: scrollController,
            itemCount: transferHistoryBloc.listTransferHistory.length + 1,
            itemBuilder: (context, index) {
              if (index < transferHistoryBloc.listTransferHistory.length) {
                return HistoryTile(
                    transferHistory:
                        transferHistoryBloc.listTransferHistory[index]);
              } else {
                if (state is TransferHistoryEmpty) {
                  return const SizedBox();
                }
                return const Center(child: CircularProgressIndicator());
              }
            });
      },
    );
  }
}

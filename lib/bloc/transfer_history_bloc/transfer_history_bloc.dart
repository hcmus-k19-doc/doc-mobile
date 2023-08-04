import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/model/transfer_history.dart';
import 'package:flutter_app/repositories/user_repository.dart';

part 'transfer_history_event.dart';

part 'transfer_history_state.dart';

class TransferHistoryBloc
    extends Bloc<TransferHistoryEvent, TransferHistoryState> {
  UserRepository userRepository;
  List<TransferHistory> listTransferHistory = [];
  int page = 0;
  int numTransferHistory = 0;

  TransferHistoryBloc(this.userRepository) : super(TransferHistoryInitial()) {
    on<FetchTransferHistoryEvent>((event, emit) async {
      page = 0;
      listTransferHistory = [];
      try {
        emit(TransferHistoryLoading());
        final response = await userRepository.fetchTransferHistoryList(
            page, event.userId, 10);
        page++;
        if (response.isEmpty) {
          emit(TransferHistoryEmpty());
        } else {
          listTransferHistory.addAll(response);
          emit(TransferHistorySuccess(listTransferHistory));
        }
      } catch (error) {
        emit(TransferHistoryFailure(error));
      }
    });

    on<FetchMoreTransferHistoryEvent>((event, emit) async {
      if (state is! TransferHistoryEmpty) {
        try {
          if (state is TransferHistoryInitial) {
            emit(TransferHistoryLoading());
          }
          if (state is TransferHistorySuccess) {
            emit(TransferHistoryFetchMore());
          }

          final response = await userRepository.fetchTransferHistoryList(
              page, event.userId, 10);
          page++;
          if (response.isEmpty) {
            emit(TransferHistoryEmpty());
          } else {
            listTransferHistory.addAll(response);
            emit(TransferHistorySuccess(listTransferHistory));
          }
        } catch (error) {
          emit(TransferHistoryFailure(error));
        }
      }
    });

    on<FetchNumberTransferHistoryEvent>((event, emit) async {
      try {
        numTransferHistory = await userRepository.fetchUnreadNoti();
        emit(TransferHistorySuccess(listTransferHistory));
      } catch (error) {
        emit(TransferHistoryFailure(error));
      }
    });
    on<ReadAHistoryEvent>((event, emit) async {
      if (event.isRead == false) {
        try {
          listTransferHistory[listTransferHistory
                  .indexWhere((element) => element.id == event.docId)]
              .isRead = true;
          await userRepository.readAHistory(event.docId);
          numTransferHistory = await userRepository.fetchUnreadNoti();
          emit(TransferHistorySuccess(listTransferHistory));
        } catch (error) {}
      }
    });
    on<MarkReadAllEvent>((event, emit) async {
      try {
        final newList =
            listTransferHistory.map((e) => e.copyWith(isRead: true)).toList();
        listTransferHistory = newList;
        await userRepository.markAllDoc();
        numTransferHistory = 0;
        emit(TransferHistorySuccess(listTransferHistory));
      } catch (error) {}
    });
  }
}

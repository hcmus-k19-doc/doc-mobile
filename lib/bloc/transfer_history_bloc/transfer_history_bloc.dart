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

  TransferHistoryBloc(this.userRepository) : super(TransferHistoryInitial()) {
    on<FetchTransferHistoryEvent>((event, emit) async {
      if (state is! TransferHistoryEmpty) {
        try {
          if (state is TransferHistoryInitial) {
            emit(TransferHistoryLoading());
          }
          if (state is TransferHistorySuccess) {
            emit(TransferHistoryFetchMore());
          }

          final response =
              await userRepository.fetchTransferHistoryList(page, event.userId);
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
  }
}

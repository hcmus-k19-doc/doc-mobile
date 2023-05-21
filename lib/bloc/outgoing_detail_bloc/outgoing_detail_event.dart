part of 'outgoing_detail_bloc.dart';

abstract class OutgoingDetailEvent extends Equatable {
  const OutgoingDetailEvent();
}

class FetchOutgoingDetailEvent extends OutgoingDetailEvent {
  @override
  List<Object?> get props => [];
}

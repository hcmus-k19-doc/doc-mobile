part of 'incoming_detail_bloc.dart';

abstract class IncomingDetailEvent extends Equatable {
  const IncomingDetailEvent();
}

class FetchIncomingDetailEvent extends IncomingDetailEvent {
  @override
  List<Object?> get props => [];
}
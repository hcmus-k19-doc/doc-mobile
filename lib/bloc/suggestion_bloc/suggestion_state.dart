part of 'suggestion_bloc.dart';

abstract class SuggestionState extends Equatable {
  const SuggestionState();
  @override
  List<Object> get props => [];
}

class SuggestionInitial extends SuggestionState {}

class SuggestionEmit extends SuggestionState {
  final List<DocumentType> documentTypes;
  final List<DistributionOrg> distributionOrgs;

  const SuggestionEmit(this.documentTypes, this.distributionOrgs);
  @override
  List<Object> get props => [];
}

class SuggestionLoading extends SuggestionState {}

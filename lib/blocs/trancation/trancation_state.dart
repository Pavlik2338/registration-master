part of 'trancation_bloc.dart';

abstract class TrancationState extends Equatable {
  const TrancationState();

  @override
  List<Object> get props => [];
}

class TrancationInitial extends TrancationState {}



class TrancationLoading extends TrancationState {}

class TrancationSuccess extends TrancationState {}

class TrancationError extends TrancationState {}
class FetchLoadingState extends TrancationState {}

class FetchState extends TrancationState {
  final List<TransactionModel> transactions;

  const FetchState(this.transactions);
}
